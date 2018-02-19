defmodule Chat.ServerTest do
  use ExUnit.Case
  doctest Chat.Server

  test "create chat room and send/get messages" do
    {:ok, pid} = Chat.Server.start_link()
    assert Chat.Server.get_messages(pid) == []
    Chat.Server.add_message(pid, "foo")
    Chat.Server.add_message(pid, "last message")

    assert Chat.Server.get_messages(pid) == ["last message", "foo"]
  end

  test "create multiple chat rooms" do
    {:ok, room1} = Chat.Server.start_link()
    Chat.Server.add_message(room1, "foo")
    Chat.Server.add_message(room1, "bar")

    {:ok, room2} = Chat.Server.start_link()
    Chat.Server.add_message(room2, "elixir")
    Chat.Server.add_message(room2, "is")
    Chat.Server.add_message(room2, "awesome")

    assert Chat.Server.get_messages(room1) == ["bar", "foo"]
    assert Chat.Server.get_messages(room2) == ["awesome", "is", "elixir"]
  end
end
