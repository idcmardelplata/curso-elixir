defimpl Computadora, for: Any do
  def encender(item), do: "La #{item.tipo} se esta prendiendo"
  def apagar(item), do: "La #{item.tipo} se esta apagando"
end
