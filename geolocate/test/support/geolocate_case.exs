defmodule Geolocate.Case do
  use ExUnit.CaseTemplate

  using do
    quote do
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
    end
  end
end
