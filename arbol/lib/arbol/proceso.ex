defmodule Proceso do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  @impl true
  def init(nil) do
    pid = spawn(fn -> Process.sleep(5000) end)
    {:ok, pid}
  end
end
