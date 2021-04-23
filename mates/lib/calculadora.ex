defmodule Mates do
  @moduledoc """
  Modulo basico con algunas funciones matematicas.

  Esto es realmente innecesario porque elixir ya posee funciones
  para realizar operaciones matematicas.

  ## Example
  iex> Mates.suma(25,11)
  36
  """

  alias Mates.Operation

  @doc """
  add `x` and `y` and return the result of the suma. 
  """
  def suma(x, y) do
    Mates.Private.operar(%Operation{a: x, b: y, operation: &+/2})
  end

  @doc """
  resta dos numeros.
  ## Examples
  iex> Mates.resta(22,11)
  11
  """
  def resta(x, y) do
    Mates.Private.operar(%Operation{a: x, b: y, operation: &-/2})
  end

  def multiplicar(x, y) do
    Mates.Private.operar(%Operation{a: x, b: y, operation: &*/2})
  end

  def dividir(x, y) when x > 0 and y > 0 do
    Mates.Private.operar(%Operation{a: x, b: y, operation: &div/2})
  end
end
