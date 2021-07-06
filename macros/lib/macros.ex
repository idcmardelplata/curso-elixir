defmodule CompileTime do
  defmacro compile() do
    IO.puts "Otro mensaje"
  end
end

defmodule Macros do
  require CompileTime
  CompileTime.compile()

  def sayHello, do: IO.puts("Hola mundo")
end
