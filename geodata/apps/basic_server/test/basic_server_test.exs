defmodule BasicServerTest do
  use ExUnit.Case
  doctest BasicServer
  use Plug.Test

  @options BasicServer.init([])
  @base "/"

  test "request to / should return webpage with the title 'Geolocalizador'" do
    conn = conn(:get, @base, %{}) |> BasicServer.call(@options)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body =~ "Geolocalizador"
  end

  test "request to /ip/190.18.133.55 sould return a dictionary with longitude and latitude keys" do
    conn = conn(:get, "#{@base}ip/190.18.133.55", %{}) |> BasicServer.call(@options)
    assert conn.state == :sent
    assert conn.status == 200

    %{"longitude" => long, "latitude" => lat} = Jason.decode!(conn.resp_body)

    assert long < -56.5
    assert lat > -40.9

    {status, _headers, _body} = sent_resp(conn)
    assert status == 200
  end

end
