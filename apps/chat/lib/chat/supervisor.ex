defmodule Chat.Supervisor do
  use Supervisor

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, [], opts)
  end

  def add_room(room_name) do
    Supervisor.start_child(:chat_supervisor, [room_name])
  end

  def init(_) do
    children = [
      worker(Chat.Server, [])
    ]

    supervise(children, strategy: :simple_one_for_one)
  end
end
