defmodule Chat.Server do
  @moduledoc """
  Example Credit:
  https://m.alphasights.com/process-registry-in-elixir-a-practical-example-4500ee7c0dcc
  """
  use GenServer

  def start_link(room_name) do
    # Initializes, calling init([])
    GenServer.start_link(__MODULE__, [], name: via_tuple(room_name))
  end

  defp via_tuple(room_name) do
    {:via, :gproc, {:n, :l, {:chat_room, room_name}}}
  end

  def add_message(room_name, message) do
    GenServer.cast(via_tuple(room_name), {:add_message, message})
  end

  def get_messages(room_name) do
    GenServer.call(via_tuple(room_name), :get_messages)
  end

  def init(messages) do
    # Initial State
    {:ok, messages}
  end

  def handle_cast({:add_message, new_message}, messages) do
    # Set new state to new_message + existing messages
    {:noreply, [new_message | messages]}
  end

  def handle_call(:get_messages, _from, messages) do
    {:reply, messages, messages}
  end
end
