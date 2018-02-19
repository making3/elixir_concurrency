defmodule Chat.ServerTest do
  use ExUnit.Case
  doctest Chat.Server

  test "create chat room and send/get messages" do
    room_name = "matt's chat"
    {:ok, _} = Chat.Server.start_link(room_name)
    assert Chat.Server.get_messages(room_name) == []
    Chat.Server.add_message(room_name, "foo")
    Chat.Server.add_message(room_name, "last message")

    assert Chat.Server.get_messages(room_name) == ["last message", "foo"]
  end

  test "create multiple chat rooms" do
    first_room = "first room"
    {:ok, _} = Chat.Server.start_link(first_room)
    Chat.Server.add_message(first_room, "foo")
    Chat.Server.add_message(first_room, "bar")

    second_room = "second room"
    {:ok, _} = Chat.Server.start_link(second_room)
    Chat.Server.add_message(second_room, "elixir")
    Chat.Server.add_message(second_room, "is")
    Chat.Server.add_message(second_room, "awesome")

    assert Chat.Server.get_messages(first_room) == ["bar", "foo"]
    assert Chat.Server.get_messages(second_room) == ["awesome", "is", "elixir"]
  end

  test "non-crashed chat rooms should keep messages" do
    first_room = "room1"
    {:ok, pid} = Chat.Supervisor.add_room(first_room)
    Chat.Server.add_message(first_room, "message")
    Chat.Server.add_message(first_room, "training")

    second_room = "room2"
    Chat.Supervisor.add_room(second_room)
    Chat.Server.add_message(second_room, "other")
    Chat.Server.add_message(second_room, "room")

    assert Chat.Server.get_messages(first_room) == ["training", "message"]
    assert Chat.Server.get_messages(second_room) == ["room", "other"]

    Process.exit(pid, :kill)

    :timer.sleep(10)
    # First room should reset, second room should remain
    assert Chat.Server.get_messages(first_room) == []
    assert Chat.Server.get_messages(second_room) == ["room", "other"]
  end
end
