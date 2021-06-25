defmodule BasicServer do
 use Plug.Router
  @template_dir "apps/basic_server/lib/templates"

  plug :match
  plug :dispatch

  get "/" do
    render(conn, "index.html", api_token: get_token())
  end

  get "/ip/:address" do
    %{"longitude" => long, "latitude" => lat} = Geolocate.locate(address)
    coords = %{"longitude" => long, "latitude" => lat}
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(coords))
    |> halt()
  end

  match _ do
    send_resp(conn, 404, "Lo siento, el recurso no se ha econtrado" )
  end

  defp render(%{status: status} = conn, template, assigns \\ []) do
    body = 
      @template_dir
    |> Path.join(template)
    |> String.replace_suffix(".html", ".html.eex")
    |> EEx.eval_file(assigns)

    send_resp(conn, status || 200, body)
  end

  defp get_token, do: Application.get_env(:basic_server, :api_token)
end
