defmodule GeolocateTest do
  use ExUnit.Case
  doctest Geolocate

  setup_all do
    valid_ips = File.stream!("./ips.txt") |> Stream.map(&String.trim/1) |> Enum.take(10)

    invalid_ips = [
      "254.254.254.254",
      "127.0.0.1",
      "192.0.2.0",
      "192.0.2.255",
      "198.51.100.0",
      "198.51.100.255",
      "203.0.113.0",
      "203.0.113.255",
      "0.0.0.0",
      "911.119.25.0"
    ]

    %{valid_address: valid_ips, invalid_address: invalid_ips}
  end

  describe "Geolocate.Locate.valid_ip?" do
    test "la ip deberia tener una forma como '200.119.225.11'", %{valid_address: ips} do
      for ip <- ips, do: Geolocate.Locate.valid_ip?(ip) == true
    end

    test "lanza una excepcion si la ip es invalida", %{invalid_address: ips} do
      for ip <- ips, do: assert_raise(Locate.Error, fn -> Geolocate.Locate.valid_ip?(ip) end)
    end

    @tag :integration_test
    test "siempre falla" do
      assert false
    end
  end
end
