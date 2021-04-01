defmodule Modulo2 do
  def start_link() do
    IO.puts("Proceso MODULO2 Iniciado")

    pid =
      spawn(fn ->
        Process.register(self(), :modulo2)
        Process.sleep(60 * 5000)
      end)

    {:ok, pid}
  end

  def child_spec(_) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, []},
      type: :worker,
      restart: :permanent
    }
  end
end
