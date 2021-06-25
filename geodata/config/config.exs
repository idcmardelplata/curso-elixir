# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :basic_server,
api_token: "pk.eyJ1IjoiaXNjaHVtbWVyIiwiYSI6ImNrcTloanB5bTBxYWoybm1xaXZnM2Rmem4ifQ.JwBE3jNIs48dVg0EsNqD1g"
config :geolocate, :http_client, PoisonClient
config :geolocate, :apikey, File.read!(".env") |> String.trim()
config :geolocate, :decoder, Jason

import_config "#{config_env()}.exs"
