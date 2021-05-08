defmodule GeolocateTest do
  use ExUnit.Case, async: true
  doctest Geolocate
  import ExUnit.CaptureIO
  import Mox

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
  end

  describe "Geolocate.Locate.locate/1" do
    setup :verify_on_exit!

    test "dada una direccion ip me debe retornar un diccionario" do
      expect(PoisonClientMock, :get, fn _ip ->
        %{
          "city" => "Xichuan Xian"
        }
        |> Jason.encode!()
      end)

      %{"city" => city} = Geolocate.Locate.locate("123.11.119.48")
      assert city == "Xichuan Xian"
    end
  end

  @tag :integration_test
  test "almacena y carga el archivo de log correctamente", %{valid_address: ips} do
    ips = Enum.take(ips, 2)
    Geolocate.locate(ips, write_log_in: "mydata.json")
    loaded_data = File.read!("mydata.json") |> Jason.decode!()
    assert length(loaded_data) == 2
  end

  test "captura la entrada y la salida" do
    assert capture_io(fn ->
             IO.puts("Hola mundo")
           end) == "Hola mundo\n"

    assert capture_io(:stderr, fn ->
             IO.puts(:stderr, "Adios mundo")
           end) == "Adios mundo\n"
  end
end
