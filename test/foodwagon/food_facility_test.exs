defmodule Foodwagon.FoodFacilityTest do
  use Foodwagon.DataCase

  alias Foodwagon.FoodFacility

  describe "mobile_food_facilities" do
    alias Foodwagon.FoodFacility.MobileFoodFacility

    import Foodwagon.FoodFacilityFixtures

    @invalid_attrs %{address: nil, block: nil, blocklot: nil, business_name: nil, cnn: nil, dayshours: nil, facity_type: nil, food_items: nil, latitude: nil, location: nil, location_description: nil, locationid: nil, longitude: nil, lot: nil, permit: nil, status: nil}

    test "list_mobile_food_facilities/0 returns all mobile_food_facilities" do
      mobile_food_facility = mobile_food_facility_fixture()
      assert FoodFacility.list_mobile_food_facilities() == [mobile_food_facility]
    end

    test "get_mobile_food_facility!/1 returns the mobile_food_facility with given id" do
      mobile_food_facility = mobile_food_facility_fixture()
      assert FoodFacility.get_mobile_food_facility!(mobile_food_facility.id) == mobile_food_facility
    end

    test "create_mobile_food_facility/1 with valid data creates a mobile_food_facility" do
      valid_attrs = %{address: "some address", block: "some block", blocklot: "some blocklot", business_name: "some business_name", cnn: "some cnn", dayshours: "some dayshours", facity_type: "some facity_type", food_items: "some food_items", latitude: "some latitude", location: "some location", location_description: "some location_description", locationid: "some locationid", longitude: "some longitude", lot: "some lot", permit: "some permit", status: "some status"}

      assert {:ok, %MobileFoodFacility{} = mobile_food_facility} = FoodFacility.create_mobile_food_facility(valid_attrs)
      assert mobile_food_facility.address == "some address"
      assert mobile_food_facility.block == "some block"
      assert mobile_food_facility.blocklot == "some blocklot"
      assert mobile_food_facility.business_name == "some business_name"
      assert mobile_food_facility.cnn == "some cnn"
      assert mobile_food_facility.dayshours == "some dayshours"
      assert mobile_food_facility.facity_type == "some facity_type"
      assert mobile_food_facility.food_items == "some food_items"
      assert mobile_food_facility.latitude == "some latitude"
      assert mobile_food_facility.location == "some location"
      assert mobile_food_facility.location_description == "some location_description"
      assert mobile_food_facility.locationid == "some locationid"
      assert mobile_food_facility.longitude == "some longitude"
      assert mobile_food_facility.lot == "some lot"
      assert mobile_food_facility.permit == "some permit"
      assert mobile_food_facility.status == "some status"
    end

    test "create_mobile_food_facility/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FoodFacility.create_mobile_food_facility(@invalid_attrs)
    end

    test "update_mobile_food_facility/2 with valid data updates the mobile_food_facility" do
      mobile_food_facility = mobile_food_facility_fixture()
      update_attrs = %{address: "some updated address", block: "some updated block", blocklot: "some updated blocklot", business_name: "some updated business_name", cnn: "some updated cnn", dayshours: "some updated dayshours", facity_type: "some updated facity_type", food_items: "some updated food_items", latitude: "some updated latitude", location: "some updated location", location_description: "some updated location_description", locationid: "some updated locationid", longitude: "some updated longitude", lot: "some updated lot", permit: "some updated permit", status: "some updated status"}

      assert {:ok, %MobileFoodFacility{} = mobile_food_facility} = FoodFacility.update_mobile_food_facility(mobile_food_facility, update_attrs)
      assert mobile_food_facility.address == "some updated address"
      assert mobile_food_facility.block == "some updated block"
      assert mobile_food_facility.blocklot == "some updated blocklot"
      assert mobile_food_facility.business_name == "some updated business_name"
      assert mobile_food_facility.cnn == "some updated cnn"
      assert mobile_food_facility.dayshours == "some updated dayshours"
      assert mobile_food_facility.facity_type == "some updated facity_type"
      assert mobile_food_facility.food_items == "some updated food_items"
      assert mobile_food_facility.latitude == "some updated latitude"
      assert mobile_food_facility.location == "some updated location"
      assert mobile_food_facility.location_description == "some updated location_description"
      assert mobile_food_facility.locationid == "some updated locationid"
      assert mobile_food_facility.longitude == "some updated longitude"
      assert mobile_food_facility.lot == "some updated lot"
      assert mobile_food_facility.permit == "some updated permit"
      assert mobile_food_facility.status == "some updated status"
    end

    test "update_mobile_food_facility/2 with invalid data returns error changeset" do
      mobile_food_facility = mobile_food_facility_fixture()
      assert {:error, %Ecto.Changeset{}} = FoodFacility.update_mobile_food_facility(mobile_food_facility, @invalid_attrs)
      assert mobile_food_facility == FoodFacility.get_mobile_food_facility!(mobile_food_facility.id)
    end

    test "delete_mobile_food_facility/1 deletes the mobile_food_facility" do
      mobile_food_facility = mobile_food_facility_fixture()
      assert {:ok, %MobileFoodFacility{}} = FoodFacility.delete_mobile_food_facility(mobile_food_facility)
      assert_raise Ecto.NoResultsError, fn -> FoodFacility.get_mobile_food_facility!(mobile_food_facility.id) end
    end

    test "change_mobile_food_facility/1 returns a mobile_food_facility changeset" do
      mobile_food_facility = mobile_food_facility_fixture()
      assert %Ecto.Changeset{} = FoodFacility.change_mobile_food_facility(mobile_food_facility)
    end
  end
end
