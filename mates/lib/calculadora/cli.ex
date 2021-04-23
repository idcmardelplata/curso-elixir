defmodule Mates.CLI do
  def start() do
    [n1, n2] = IO.gets("Ingresa dos numeros: ") |> parse_number_input()

    operation =
      IO.gets("Ingresa una operacion o q para terminar (+ - * /): ") |> parse_operation()

    resultado = operate(operation, {n1, n2})

    operacion = "#{Atom.to_string(operation)}"

    IO.puts("El resultado de #{n1} #{operacion} #{n2} es igual a: #{resultado}")

    start()
  end

  defp operate(operation, {n1, n2}) do
    case_return =
      case operation do
        :+ -> Mates.suma(n1, n2)
        :- -> Mates.resta(n1, n2)
        :* -> Mates.multiplicar(n1, n2)
        :/ -> Mates.dividir(n1, n2)
        :q -> System.halt(0)
      end

    case_return
  end

  defp parse_operation(str) do
    atom_return =
      str
      |> String.trim()
      |> String.to_atom()

    atom_return
  end

  defp parse_number_input(str) do
    list_return =
      str
      |> String.split(" ")
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.to_integer/1)

    list_return
  end
end
