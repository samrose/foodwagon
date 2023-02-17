defmodule FoodwagonWeb.MobileFoodFacilityController do
  use FoodwagonWeb, :controller

  alias Foodwagon.FoodFacility
  alias Foodwagon.FoodFacility.MobileFoodFacility

  action_fallback FoodwagonWeb.FallbackController

  def index(conn, _params) do
    mobile_food_facilities = FoodFacility.list_mobile_food_facilities()
    render(conn, "index.json", mobile_food_facilities: mobile_food_facilities)
  end

  def create(conn, %{"mobile_food_facility" => mobile_food_facility_params}) do
    with {:ok, %MobileFoodFacility{} = mobile_food_facility} <- FoodFacility.create_mobile_food_facility(mobile_food_facility_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.mobile_food_facility_path(conn, :show, mobile_food_facility))
      |> render("show.json", mobile_food_facility: mobile_food_facility)
    end
  end

  def show(conn, %{"id" => id}) do
    mobile_food_facility = FoodFacility.get_mobile_food_facility!(id)
    render(conn, "show.json", mobile_food_facility: mobile_food_facility)
  end

  def update(conn, %{"id" => id, "mobile_food_facility" => mobile_food_facility_params}) do
    mobile_food_facility = FoodFacility.get_mobile_food_facility!(id)

    with {:ok, %MobileFoodFacility{} = mobile_food_facility} <- FoodFacility.update_mobile_food_facility(mobile_food_facility, mobile_food_facility_params) do
      render(conn, "show.json", mobile_food_facility: mobile_food_facility)
    end
  end

  def delete(conn, %{"id" => id}) do
    mobile_food_facility = FoodFacility.get_mobile_food_facility!(id)

    with {:ok, %MobileFoodFacility{}} <- FoodFacility.delete_mobile_food_facility(mobile_food_facility) do
      send_resp(conn, :no_content, "")
    end
  end
end
