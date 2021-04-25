defmodule Mates do
@moduledoc """
En este modulo y el condicional cond para aceptar mas operaciones,
Tambien movemos el pattern matching dentro de los parametros de la funcion


Para ello definimos una funcion privada llamada operar
que toma una tupla con la forma {:operacion, x,y } y hace una operacion matematica con ellos.

"""
  def suma(x,y) do
    operar({:suma, x,y})
  end

  def resta(x,y) do
    operar({:resta, x,y})
  end

  def division(x,y) when x > 0 and y > 0 do
    operar({:division, x, y})
  end

  def multiplicar(x,y) do
    operar({:multiplicar, x, y})
  end

  defp operar({operador, x,y}) do
    cond do
      operador == :suma -> x + y
      operador == :resta -> x - y
      operador == :division -> div(x,y)
      operador == :multiplicar -> x * y
      true ->
        IO.puts(:stderr, "Operacion no soportada.")
        :error
    end
  end

end

resultado = Mates.suma(12,24)
IO.puts("El resultado es: #{resultado}")

resultado = Mates.resta(33,24)
IO.puts("El resultado es: #{resultado}")


resultado = Mates.division(100,6)
IO.puts("El resultado es: #{resultado}")

resultado = Mates.multiplicar(23,6)
IO.puts("El resultado es: #{resultado}")
