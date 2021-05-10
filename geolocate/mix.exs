defmodule Geolocate.MixProject do
  use Mix.Project

  def project do
    [
      app: :geolocate,
      version: "0.1.0",
      elixir: "~> 1.12-dev",
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
