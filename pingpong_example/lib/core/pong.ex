defmodule Pong do
  def pong() do
    receive do
      {:pong, ping_id} ->
        State.set(1)
        IO.puts("#{State.get()}<----- Pong!")
        Process.sleep(500)
        send(ping_id, {:ping, self()})
        pong()

      _ ->
        pong()
    end
  end
end
