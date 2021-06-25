import Config

config :geolocate, :http_client, PoisonClient
config :geolocate, :apikey, File.read!(".env") |> String.trim()
config :geolocate, :decoder, Jason
