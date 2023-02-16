defmodule Foodwagon.Repo do
  use Ecto.Repo,
    otp_app: :foodwagon,
    adapter: Ecto.Adapters.Postgres
end
