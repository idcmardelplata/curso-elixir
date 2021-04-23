defmodule Stack.Application do
  use Application

  def start(:normal, _args) do
    children = [
      Store
    ]

    opts = [strategy: :one_for_one, name: Stack.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
