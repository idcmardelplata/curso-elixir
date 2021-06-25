defmodule Geolocate.MixProject do
  use Mix.Project

  def project do
    [
      app: :geolocate,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.12-dev",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Geolocate.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", Path.wildcard("test/support/*.exs") |> Enum.at(0)]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.2"},
      {:mix_test_watch, "~> 1.0.2"},
      {:mox, "~> 1.0.0", only: [:test]},
      {:excoveralls, "~> 0.14.0", only: :test}
    ]
  end
end
