defmodule Foodwagon.Repo.Migrations.CreateMobileFoodFacilities do
  use Ecto.Migration

  def change do
    create table(:mobile_food_facilities) do
      add :locationid, :string
      add :business_name, :string
      add :facity_type, :string
      add :cnn, :string
      add :location_description, :string
      add :address, :string
      add :blocklot, :string
      add :block, :string
      add :lot, :string
      add :permit, :string
      add :status, :string
      add :food_items, :string
      add :latitude, :string
      add :longitude, :string
      add :dayshours, :string
      add :location, :string

      timestamps()
    end
    create unique_index(:mobile_food_facilities, [:location])
  end
end
