defmodule Foodwagon.FoodFacilityFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Foodwagon.FoodFacility` context.
  """

  @doc """
  Generate a mobile_food_facility.
  """
  def mobile_food_facility_fixture(attrs \\ %{}) do
    {:ok, mobile_food_facility} =
      attrs
      |> Enum.into(%{
        address: "some address",
        block: "some block",
        blocklot: "some blocklot",
        business_name: "some business_name",
        cnn: "some cnn",
        dayshours: "some dayshours",
        facity_type: "some facity_type",
        food_items: "some food_items",
        latitude: "some latitude",
        location: "some location",
        location_description: "some location_description",
        locationid: "some locationid",
        longitude: "some longitude",
        lot: "some lot",
        permit: "some permit",
        status: "some status"
      })
      |> Foodwagon.FoodFacility.create_mobile_food_facility()

    mobile_food_facility
  end
end
