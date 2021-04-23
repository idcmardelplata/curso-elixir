defmodule Recur do
  def greeter(name, count \\ 1) do
    run_times(fn -> IO.puts("Hola #{name}") end, count)
  end

  def each([], _func), do: nil

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def run_times(func, count \\ 1) do
    if count >= 1 do
      func.()
      run_times(func, count - 1)
    end
  end

  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def map([], _func), do: []

  def map([head | tail], func) do
    [func.(head) | map(tail, func)]
  end

  def filter([], _func), do: []

  def filter([head | tail], func) do
    (func.(head) && [head | filter(tail, func)]) || filter(tail, func)
  end

  def reduce([], acumulador, _func), do: acumulador

  def reduce([head | tail], acumulador, func) do
    new_acc = func.(head, acumulador)
    reduce(tail, new_acc, func)
  end
end

defmodule Atributos do
  @deprecated "use add/1 instead addname"
  @on_load :init
  @vsn "0.1.0"

  @name "martin"

  def load_key() do
    Application.get_env(:recur, :api_key, "6677fsdfhds")
  end

  def addname(name) do
    if name == @name do
      IO.puts("Hola martin")
    end
  end

  def add(params) do
    IO.puts("Hola #{params}")
  end

  def init do
    IO.puts("Modulo cargado")
  end
end
