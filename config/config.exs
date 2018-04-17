# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :chess_earth,
  ecto_repos: [ChessEarth.Repo]

# Configures the endpoint
config :chess_earth, ChessEarthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RWUxdrShFGV8L0/TiIDWBrlFy3SuTf+5dcWhq6Wi6BjhSo+7qfCM3rOUM9lb2qJv",
  render_errors: [view: ChessEarthWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ChessEarth.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
