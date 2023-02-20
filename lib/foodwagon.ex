defmodule Foodwagon do
  @moduledoc """
  Foodwagon keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
end

defmodule Foodwagon.DataSetupSupervisor do
    opts = [restart: :transient]

    Task.Supervisor.start_child(__MODULE__, Foodwagon.CSVUtil, :cvs_row_to_table_record, ["priv/repo/data/Mobile_Food_Facility_Permit.csv"], opts)
end
defmodule Foodwagon.CSVUtil do
  @moduledoc """
    Utility module to ingest `Mobile_Food_Facility_Permit.csv`
  """

  alias NimbleCSV.RFC4180, as: CSV

  def csv_row_to_table_record(file) do
    column_names = get_column_names(file)

    file
    |> File.stream!()
    |> CSV.parse_stream(skip_headers: true)
    |> Enum.map(fn row ->
      row
      |> Enum.with_index()
      |> Map.new(fn {val, num} -> {column_names[num], val} end)
      |> create_or_skip()
    end)
  end

  defp get_column_names(file) do
    file
    |> File.stream!()
    |> CSV.parse_stream(skip_headers: false)
    |> Enum.fetch!(0)
    |> Enum.with_index()
    |> Map.new(fn {val, num} -> {num, val} end)
  end

  defp create_or_skip(row) do
    Foodwagon.FoodFacility.create_mobile_food_facility(%{
      address: row["Address"],
      block: row["block"],
      blocklot: row["blocklot"],
      business_name: row["Applicant"],
      cnn: row["cnn"],
      dayshours: row["dayshours"],
      facility_type: row["FacilityType"],
      food_items: row["FoodItems  "],
      latitude: row["Latitude"],
      longitude: row["Longitude"],
      location: row["Location"],
      locationid: row["locationid"],
      location_description: row["LocationDescription"],
      lot: row["lot"],
      permit: row["permit"],
      status: row["Status"]
    })
  end
end
