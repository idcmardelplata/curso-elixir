defmodule Modulo4 do
  def start_link() do
    IO.puts("Proceso MODULO4 Iniciado")

    pid =
      spawn(fn ->
        Process.register(self(), :modulo4)
        Process.sleep(60 * 5000)
      end)

    {:ok, pid}
  end

  def child_spec(_) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, []},
      type: :worker
    }
  end
end
