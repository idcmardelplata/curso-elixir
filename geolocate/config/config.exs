defmodule Geolocate.Config do
  import Mix.Config

  config :geolocate, :http_client, PoisonClient
  config :geolocate, :apikey, File.read!(".env") |> String.trim()
  config :geolocate, :decoder, Jason
end
