defmodule Super.Task do
  use Task, restart: :permanent

  def start_link(arg) do
    Task.start_link(__MODULE__, :iniciar, [arg])
  end

  def iniciar(arg) do
    IO.puts("Proceso iniciado con el argumento #{arg}")
    IO.inspect(self())
    Process.sleep(60 * 1000)
  end
end
