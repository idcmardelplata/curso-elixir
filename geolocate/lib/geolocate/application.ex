defmodule Geolocate.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Task.Supervisor, name: TaskLocate.Supervisor}
      # Starts a worker by calling: Geolocate.Worker.start_link(arg)
      # {Geolocate.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Geolocate.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
