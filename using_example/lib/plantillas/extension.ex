defmodule Template do
  def saludos do
    quote do
      def saluda(s), do: IO.puts("Hola como estas #{s}?")
      def saluda2, do: IO.puts("Hola negri como estas?")
    end
  end

  def despidos do
    quote do
      def adios(s), do: IO.puts("es una pena que te vayas #{s}")
    end
  end

  defmacro __using__(opt) when is_atom(opt) do
    apply(__MODULE__, opt, [])
  end
end
