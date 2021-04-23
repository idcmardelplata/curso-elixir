defmodule Geolocate.Helpers do
  def get_env(key) when is_atom(key) do
    Application.get_all_env(:geolocate)
    |> Keyword.get(key, :not_environment_variable_found)
  end

  def get_env(keys) when is_list(keys) do
    keys
    |> Enum.map(fn key ->
      Application.get_env(:geolocate, key, {:error, "key #{key} not found"})
    end)
  end
end
