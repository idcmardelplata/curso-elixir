defmodule FileWriter do
  use Task, restart: :transient
  import Geolocate.Helpers, only: [get_env: 1]

  def start(info, file) do
    encoder = get_env(:decoder)
    file_stream = File.stream!(file, [:utf8, :append])

    Enum.each(info |> parse_val(), fn location ->
      [location |> encoder.encode!()]
      |> Stream.into(file_stream)
      |> Stream.run()
    end)

    :ok
  end

  defp parse_val(info) do
    info
    |> Enum.map(fn
      {:ok, val} -> val
      {:exit, _} -> nil
    end)
  end
end
