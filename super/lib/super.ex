defmodule Super do
  def launch_instances(number \\ 10) do
    Enum.each(1..number, fn n ->
      DynamicSupervisor.start_child(Super.DynamicSupervisor, {Super.Task, "Task number #{n}"})
    end)
  end
end
