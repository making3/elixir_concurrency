defmodule Repeater.QueueTest do
  use ExUnit.Case
  doctest Repeater.Queue

  test "get all queue" do
    {:ok, pid} = Repeater.Queue.start_link()
    Repeater.Queue.put(pid, "foo")
    assert ["foo"] == Repeater.Queue.get(pid)

    Repeater.Queue.put(pid, "bar")
    assert ["bar", "foo"] == Repeater.Queue.get(pid)
  end

  test "get next item" do
    {:ok, pid} = Repeater.Queue.start_link()
    Repeater.Queue.put(pid, "foo")
    Repeater.Queue.put(pid, "bar")
    assert "bar" == Repeater.Queue.get_next(pid)
  end

  test "multiple queues" do
    {:ok, strings} = Repeater.Queue.start_link()
    Repeater.Queue.put(strings, "foo")
    Repeater.Queue.put(strings, "bar")

    {:ok, numbers} = Repeater.Queue.start_link()
    Repeater.Queue.put(numbers, 1)
    Repeater.Queue.put(numbers, 555)

    assert ["bar", "foo"] == Repeater.Queue.get(strings)
    assert [555, 1] == Repeater.Queue.get(numbers)
  end
end
