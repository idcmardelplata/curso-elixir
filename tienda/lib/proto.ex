defprotocol Computadora do
  @type compu :: PC.t() | Laptop.t()
  @type message :: String.t()

  @spec encender(item :: compu) :: message
  def encender(item)

  @spec apagar(item :: compu) :: message
  def apagar(item)
end
