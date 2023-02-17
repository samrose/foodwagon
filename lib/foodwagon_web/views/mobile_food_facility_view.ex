defmodule FoodwagonWeb.MobileFoodFacilityView do
  use FoodwagonWeb, :view
  alias FoodwagonWeb.MobileFoodFacilityView

  def render("index.json", %{mobile_food_facilities: mobile_food_facilities}) do
    %{data: render_many(mobile_food_facilities, MobileFoodFacilityView, "mobile_food_facility.json")}
  end

  def render("show.json", %{mobile_food_facility: mobile_food_facility}) do
    %{data: render_one(mobile_food_facility, MobileFoodFacilityView, "mobile_food_facility.json")}
  end

  def render("mobile_food_facility.json", %{mobile_food_facility: mobile_food_facility}) do
    %{
      id: mobile_food_facility.id,
      locationid: mobile_food_facility.locationid,
      business_name: mobile_food_facility.business_name,
      facity_type: mobile_food_facility.facity_type,
      cnn: mobile_food_facility.cnn,
      location_description: mobile_food_facility.location_description,
      address: mobile_food_facility.address,
      blocklot: mobile_food_facility.blocklot,
      block: mobile_food_facility.block,
      lot: mobile_food_facility.lot,
      permit: mobile_food_facility.permit,
      status: mobile_food_facility.status,
      food_items: mobile_food_facility.food_items,
      latitude: mobile_food_facility.latitude,
      longitude: mobile_food_facility.longitude,
      dayshours: mobile_food_facility.dayshours,
      location: mobile_food_facility.location
    }
  end
end
