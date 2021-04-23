defmodule PoisonClient do
  @behaviour ClientBehaviour

  def get(q) when is_binary(q) do
    case HTTPoison.get(q) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body

      {:ok, %HTTPoison.Response{status_code: 400}} ->
        IO.puts("Fallo la peticion")

      {:error, %HTTPoison.Error{id: nil, reason: reason}} ->
        IO.puts("Ocurrio un error: #{reason}")
    end
  end
end
