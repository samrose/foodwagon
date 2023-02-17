defmodule FoodwagonWeb.MobileFoodFacilityControllerTest do
  use FoodwagonWeb.ConnCase

  import Foodwagon.FoodFacilityFixtures

  alias Foodwagon.FoodFacility.MobileFoodFacility

  @create_attrs %{
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
  }
  @update_attrs %{
    address: "some updated address",
    block: "some updated block",
    blocklot: "some updated blocklot",
    business_name: "some updated business_name",
    cnn: "some updated cnn",
    dayshours: "some updated dayshours",
    facity_type: "some updated facity_type",
    food_items: "some updated food_items",
    latitude: "some updated latitude",
    location: "some updated location",
    location_description: "some updated location_description",
    locationid: "some updated locationid",
    longitude: "some updated longitude",
    lot: "some updated lot",
    permit: "some updated permit",
    status: "some updated status"
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all mobile_food_facilities", %{conn: conn} do
      conn = get(conn, Routes.mobile_food_facility_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create mobile_food_facility" do
    test "renders mobile_food_facility when data is valid", %{conn: conn} do
      conn = post(conn, Routes.mobile_food_facility_path(conn, :create), mobile_food_facility: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.mobile_food_facility_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "address" => "some address",
               "block" => "some block",
               "blocklot" => "some blocklot",
               "business_name" => "some business_name",
               "cnn" => "some cnn",
               "dayshours" => "some dayshours",
               "facity_type" => "some facity_type",
               "food_items" => "some food_items",
               "latitude" => "some latitude",
               "location" => "some location",
               "location_description" => "some location_description",
               "locationid" => "some locationid",
               "longitude" => "some longitude",
               "lot" => "some lot",
               "permit" => "some permit",
               "status" => "some status"
             } = json_response(conn, 200)["data"]
    end
  end

  describe "update mobile_food_facility" do
    setup [:create_mobile_food_facility]

    test "renders mobile_food_facility when data is valid", %{conn: conn, mobile_food_facility: %MobileFoodFacility{id: id} = mobile_food_facility} do
      conn = put(conn, Routes.mobile_food_facility_path(conn, :update, mobile_food_facility), mobile_food_facility: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.mobile_food_facility_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "address" => "some updated address",
               "block" => "some updated block",
               "blocklot" => "some updated blocklot",
               "business_name" => "some updated business_name",
               "cnn" => "some updated cnn",
               "dayshours" => "some updated dayshours",
               "facity_type" => "some updated facity_type",
               "food_items" => "some updated food_items",
               "latitude" => "some updated latitude",
               "location" => "some updated location",
               "location_description" => "some updated location_description",
               "locationid" => "some updated locationid",
               "longitude" => "some updated longitude",
               "lot" => "some updated lot",
               "permit" => "some updated permit",
               "status" => "some updated status"
             } = json_response(conn, 200)["data"]
    end
  end

  describe "delete mobile_food_facility" do
    setup [:create_mobile_food_facility]

    test "deletes chosen mobile_food_facility", %{conn: conn, mobile_food_facility: mobile_food_facility} do
      conn = delete(conn, Routes.mobile_food_facility_path(conn, :delete, mobile_food_facility))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.mobile_food_facility_path(conn, :show, mobile_food_facility))
      end
    end
  end

  defp create_mobile_food_facility(_) do
    mobile_food_facility = mobile_food_facility_fixture()
    %{mobile_food_facility: mobile_food_facility}
  end
end
