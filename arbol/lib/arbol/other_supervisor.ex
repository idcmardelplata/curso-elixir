defmodule OtherSupervisor do
  use Supervisor

  def start_link(_) do
    Supervisor.start_link(__MODULE__, nil, name: __MODULE__)
  end

  @impl true
  def init(_) do
    children = [
      Supervisor.child_spec({Proceso, []}, id: :proceso5)
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
