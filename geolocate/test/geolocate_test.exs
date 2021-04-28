defmodule GeolocateTest do
  use ExUnit.Case
  doctest Geolocate

  describe "Geolocate.Locate.valid_ip?" do
    test "la ip deberia tener una forma como '200.119.225.11'" do
      assert Geolocate.Locate.valid_ip?("255.119.225.11") == true
      assert Geolocate.Locate.valid_ip?("256.119.225.11") == false
      assert Geolocate.Locate.valid_ip?("256.119.225.0") == false
      assert Geolocate.Locate.valid_ip?("0.119.225.3") == false
    end

    test "siempre falla" do
      assert true
    end
  end
end
