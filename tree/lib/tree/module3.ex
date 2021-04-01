defmodule Modulo3 do
  def start_link() do
    children = [
      {Modulo4, []}
    ]

    Supervisor.start_link(children, name: Modulo3.Supervisor, strategy: :one_for_one)
  end

  def child_spec(_) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, []},
      type: :supervisor
    }
  end
end
