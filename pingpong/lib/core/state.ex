defmodule State do
  def start() do
    pid = spawn_link(State.Internal, :loop, [0])
    Process.register(pid, :state)
  end

  def get() do
    send(:state, {:get, self()})

    receive do
      state -> state
    end
  end

  def set(new_state) do
    send(:state, {:add, self(), new_state})
  end
end

defmodule State.Internal do
  def loop(state \\ 0) do
    receive do
      {:add, _from, val} ->
        loop(state + val)

      {:get, from} ->
        send(from, state)
        loop(state)
    end

    loop(state)
  end
end
