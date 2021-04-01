defmodule Greet.Behaviour do
  @callback greet(name :: binary()) :: binary()
end

defmodule Greeter.Spanish do
  @behaviour Greet.Behaviour
  def greet(name) do
    "Hola #{name}"
  end
end

defmodule Greeter.English do
  @behaviour Greet.Behaviour
  def greet(name) do
    "Hi #{name}"
  end
end

defmodule Greeter do
  @behaviour Greet.Behaviour
  defp load_env() do
    lang = Application.fetch_env!(:greeter, :greet)

    case lang do
      "ES" -> Greeter.Spanish
      "EN" -> Greeter.English
    end
  end

  def greet(name) do
    module = load_env()
    module.greet(name)
  end
end
