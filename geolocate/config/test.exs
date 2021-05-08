  import Config

  config :geolocate, :http_client, PoisonClientMock
  config :geolocate, :apikey, File.read!(".env") |> String.trim()
  config :geolocate, :decoder, Jason
