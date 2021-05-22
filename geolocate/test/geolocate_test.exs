defmodule GeolocateTest do
  use Geolocate.Case

  describe "Geolocate.Locate.valid_ip?" do
    test "la ip deberia tener una forma como '200.119.225.11'", %{valid_address: ips} do
      for ip <- ips, do: assert(Geolocate.Locate.valid_ip?(ip) == true)
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

  @tag :skip
  test "captura la entrada y la salida" do
    assert capture_io(fn ->
             IO.puts("Hola mundo")
           end) == "Hola mundo\n"

    assert capture_io(:stderr, fn ->
             IO.puts(:stderr, "Adios mundo")
           end) == "Adios mundo\n"
  end
end
