# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :test, TestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cY2iMx7/apZ1jCoIjXjcDbd7/gDDLJNin2a/GfnPTdD9uAuDNDFM0pnCS3uMYP9A",
  render_errors: [view: TestWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Test.PubSub,
  live_view: [signing_salt: "b6FVfgOe"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
