defmodule BasicServer do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _options) do
    conn
    |> IO.inspect()
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hola mundo desde plug")
  end
end
