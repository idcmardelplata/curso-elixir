defmodule Mates do
@moduledoc """
En este modulo presentamos las funciones privadas
y el condicional if.

Para ello definimos una funcion privada llamada operar
que toma una tupla con la forma {:operacion, x,y } y hace una operacion matematica con ellos.

"""
  def suma(x,y) do
    operar({:suma, x,y})
  end

  def resta(x,y) do
    operar({:resta, x,y})

  end

  defp operar(parametros) do
    {operacion, x,y} = parametros #Extraemos los datos via pattern matching.

    if operacion == :suma do
      x + y
    else
      x - y
    end
  end

end

resultado = Mates.suma(12,24)
IO.puts("El resultado es: #{resultado}")

resultado = Mates.resta(33,24)
IO.puts("El resultado es: #{resultado}")
