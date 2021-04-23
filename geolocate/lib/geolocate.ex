defmodule Geolocate do
  @moduledoc """

  """

  @doc """

  """
  def locate(arg, opts \\ []) when is_binary(arg) or is_list(arg) do
    data = Geolocate.Locate.locate(arg)

    case Keyword.get(opts, :write_log_in, "") do
      "" ->
        data

      path ->
        Geolocate.Locate.write_log(data, path)
        data
    end
  end
end
