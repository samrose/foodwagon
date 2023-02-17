defmodule FoodwagonWeb.Router do
  use FoodwagonWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FoodwagonWeb do
    pipe_through :api
    resources "/mobile_food_facilities", MobileFoodFacilityController, except: [:new, :edit]
  end
end
