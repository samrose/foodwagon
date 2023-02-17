defmodule Foodwagon.FoodFacility.MobileFoodFacility do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mobile_food_facilities" do
    field :address, :string
    field :block, :string
    field :blocklot, :string
    field :business_name, :string
    field :cnn, :string
    field :dayshours, :string
    field :facity_type, :string
    field :food_items, :string
    field :latitude, :string
    field :location, :string
    field :location_description, :string
    field :locationid, :string
    field :longitude, :string
    field :lot, :string
    field :permit, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(mobile_food_facility, attrs) do
    mobile_food_facility
    |> cast(attrs, [:locationid, :business_name, :facity_type, :cnn, :location_description, :address, :blocklot, :block, :lot, :permit, :status, :food_items, :latitude, :longitude, :dayshours, :location])
    |> unique_constraint(:location)
    |> validate_required([:locationid])
  end
end
