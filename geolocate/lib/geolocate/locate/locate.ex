defmodule Locate.Error do
  defexception message: ""
end

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

  def valid_ip?(ip) do
    ip =
      ip
      |> String.split(".")
      |> Enum.map(&String.to_integer/1)
      |> in_range()

    length(ip) == 4
  end

  defp in_range([0, 0, 0, 0] = ip), do: raise(%Locate.Error{message: "Invalid ip #{ip}"})
  defp in_range([127, 0, 0, 1] = ip), do: raise(%Locate.Error{message: "Invalid ip #{ip}"})
  defp in_range([254, 254, 254, 254] = ip), do: raise(%Locate.Error{message: "Invalid ip #{ip}"})
  defp in_range([192, 0, 2, _] = ip), do: raise(%Locate.Error{message: "Invalid ip #{ip}"})
  defp in_range([198, 51, 100, _] = ip), do: raise(%Locate.Error{message: "Invalid ip #{ip}"})
  defp in_range([203, 0, 113, _] = ip), do: raise(%Locate.Error{message: "Invalid ip #{ip}"})

  defp in_range([a, b, c, d] = ip) when a > 0 and a <= 255 and b <= 255 and c <= 255 and d <= 255,
    do: ip

  defp in_range(_), do: raise(%Locate.Error{message: "Invalid ip"})
end
