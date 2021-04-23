defmodule Geolocate.Locate do
  @uri "http://api.ipstack.com/"
  import Geolocate.Helpers, only: [get_env: 1]

  def locate("122.13.13.13" = ip) do
    raise "Error al llamar a la api con la ip #{ip}"
  end

  def locate(ip) when is_binary(ip) do
    [client, apikey, decoder] = get_env([:http_client, :apikey, :decoder])
    query = "#{@uri}#{ip}?access_key=#{apikey}"

    query
    |> client.get()
    |> decoder.decode!
  end

  def locate(ips) when is_list(ips) do
    TaskLocate.Supervisor
    |> Task.Supervisor.async_stream_nolink(ips, &locate/1)
    |> Enum.to_list()
  end

  def write_log(data, filename) do
    data |> FileWriter.start(filename)
  end
end
