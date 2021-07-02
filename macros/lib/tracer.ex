defmodule Tracer do
  defmacro show_trace(code) do
    code_as_string = Macro.to_string(code)

    quote do
      resultado = unquote(code)
      IO.puts "Ejecutar #{unquote(code_as_string)} retorna #{resultado}"
    end
  end
end
