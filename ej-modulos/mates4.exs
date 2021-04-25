defmodule Mates do
@moduledoc """
Este modulo provee varias operaciones matematicas
como la suma, la resta, la multiplicacion y la division.
"""

@moduledoc since: "0.4.4"


  @doc """
  Dados dos numeros `x` e `y` los suma y retorna el resultado

  Returns `number`
  ## Examples

  iex> Mates.suma(12,24)
  36
  """
  def suma(x,y), do: operar({:suma, x,y})





  @doc """
  Dados dos numeros `x` e `y` los resta y retorna el resultado

  Returns `number`
  ## Examples

  iex> Mates.resta(18,6)
  12
  """
  def resta(x,y), do: operar({:resta, x,y})





  @doc """
  Dados dos numeros `x` e `y` los divide y retorna el resultado.
  Tanto el divisor como el dividendo deben ser mayores a 0.

  Returns `number`
  ## Examples

  iex> Mates.division(100,5)
  20
  """
  def division(x,y) when x > 0 and y > 0, do: operar({:division, x, y})





  @doc """
  Dados dos numeros `x` e `y` los multiplica y retorna el resultado.
  Ambos parametros deben ser superiores a 0.

  Returns `number`
  ## Examples

  iex> Mates.multiplicar(23,9)
  20
  """
  def multiplicar(x,y), do: operar({:multiplicar, x, y})




  defp operar({operador, x,y}) do
    cond do
      operador == :suma -> x + y
      operador == :resta -> x - y
      operador == :division -> div(x,y)
      operador == :multiplicar -> x * y #aqui hay que checkear que la multiplicacion no sea por 0
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


resultado = Mates.division(100,5)
IO.puts("El resultado es: #{resultado}")

resultado = Mates.multiplicar(23,9)
IO.puts("El resultado es: #{resultado}")
