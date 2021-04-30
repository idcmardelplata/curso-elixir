defmodule GeolocateTest do
  use ExUnit.Case
  doctest Geolocate

  # setup_all do
  # invalid_ips = [
  # "256.119.225.11",
  # "256.119.225.0",
  # "0.119.225.3"
  # ]

  # %{invalid_address: invalid_ips}
  # end

  setup [:invalid_ips, :valid_ips]

  describe "Geolocate.Locate.valid_ip?" do
    # setup context do
    # Map.merge(context, %{valid_address: "255.119.225.11"})
    # end

    test "la ip deberia tener una forma como '200.119.225.11'", %{valid_address: ip} do
      assert Geolocate.Locate.valid_ip?(ip) == true
    end

    test "retorna false si la ip es invalida", %{invalid_address: ips} do
      Enum.each(ips, fn ip ->
        assert Geolocate.Locate.valid_ip?(ip) == false
      end)
    end

    @tag :integration_test
    test "siempre falla" do
      assert false
    end
  end

  defp invalid_ips(context) do
    invalid_ips = [
      "256.119.225.11",
      "256.119.225.0",
      "0.119.225.3"
    ]

    Map.merge(context, %{invalid_address: invalid_ips})
  end

  defp valid_ips(context) do
    Map.merge(context, %{valid_address: "255.110.225.11"})
  end
end
