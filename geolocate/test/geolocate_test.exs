defmodule GeolocateTest do
  use ExUnit.Case
  doctest Geolocate

  describe "Geolocate.Locate.valid_ip?" do
    test "la ip deberia tener una forma como '200.119.225.11'" do
      assert Geolocate.Locate.valid_ip?("200.119.225.11") == true
    end
  end
end
