defmodule Chat.Server do
  @moduledoc """
  Example Credit:
  https://m.alphasights.com/process-registry-in-elixir-a-practical-example-4500ee7c0dcc
  """
  use GenServer

  def start_link() do
    # Initializes, calling init([])
    GenServer.start_link(__MODULE__, [])
  end

  def add_message(pid, message) do
    GenServer.cast(pid, {:add_message, message})
  end

  def get_messages(pid) do
    GenServer.call(pid, :get_messages)
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
