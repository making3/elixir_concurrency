defmodule Repeater.Queue do
  use Agent

  def start_link do
    Agent.start_link(fn -> [] end)
  end

  def get(pid) do
    Agent.get(pid, fn state -> state end)
  end

  def get_next(pid) do
    Agent.get_and_update(pid, fn [head | tail] -> {head, tail} end)
  end

  def put(pid, text) do
    Agent.update(pid, fn state -> [text | state] end)
  end
end
