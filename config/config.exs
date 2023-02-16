# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :foodwagon,
  ecto_repos: [Foodwagon.Repo]

# Configures the endpoint
config :foodwagon, FoodwagonWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: FoodwagonWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Foodwagon.PubSub,
  live_view: [signing_salt: "7uFPNbr/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
