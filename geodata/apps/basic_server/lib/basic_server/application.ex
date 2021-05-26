defmodule BasicServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: BasicServer.Worker.start_link(arg)
      # {BasicServer.Worker, arg}
      {Plug.Cowboy, scheme: :http, plug: BasicServer, options: [port: 4001]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BasicServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
