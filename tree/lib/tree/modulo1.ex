defmodule Modulo1 do
  def start_link() do
    children = [
      {Modulo2, []},
      {Modulo3, []}
    ]

    Supervisor.start_link(children, name: Modulo1.Supervisor, strategy: :one_for_one)
  end

  def child_spec(_) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, []},
      type: :supervisor
    }
  end
end
