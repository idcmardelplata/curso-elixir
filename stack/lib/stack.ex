defmodule Stack do
  use GenServer

  # Cliente
  defp via(name) do
    {:via, Registry, {Registry.Store, name}}
  end

  def start_link(name) do
    GenServer.start_link(__MODULE__, [], name: via(name))
  end

  def push(name, valor) do
    GenServer.cast(via(name), {:push, valor})
  end

  def pop(name) do
    GenServer.call(via(name), :pop)
  end

  # Proceso (servidor)
  def init([]) do
    {:ok, [], {:continue, :iniciar}}
  end

  def handle_cast({:push, valor}, state) do
    {:noreply, [valor | state]}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_continue(:iniciar, []) do
    IO.puts("Iniciando desde handle_continue")
    Process.sleep(5000)
    {:noreply, []}
  end
end

defmodule Store do
  def start_link(opts \\ []) do
    name = Keyword.get(opts, :name, __MODULE__)

    case Process.whereis(Registry.Store) do
      nil -> Registry.start_link(keys: :unique, name: Registry.Store)
      _pid -> nil
    end

    Stack.start_link(name)
  end

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]},
      type: :worker,
      restart: :permanent,
      shutdown: 500
    }
  end
end
