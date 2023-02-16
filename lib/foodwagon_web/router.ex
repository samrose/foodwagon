defmodule FoodwagonWeb.Router do
  use FoodwagonWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FoodwagonWeb do
    pipe_through :api
  end
end
