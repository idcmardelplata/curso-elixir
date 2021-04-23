defmodule Ping do
  def ping() do
    receive do
      {:ping, pong_id} ->
        State.set(1)
        IO.puts("Ping! -----> #{State.get()}")
        Process.sleep(500)
        send(pong_id, {:pong, self()})
        ping()

      :boom ->
        exit(:CHAU)

      _ ->
        ping()
    end
  end
end
