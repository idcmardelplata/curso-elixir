defmodule Mates do
  def suma(x,y) do
    IO.puts("La suma es #{x + y}")
    x + y
  end
end

resultado = Mates.suma(12,24)

IO.puts("El resultado es: #{resultado}")
