defmodule RepeaterTest do
  use ExUnit.Case
  doctest Repeater

  test "greets the world" do
    assert Repeater.hello() == :world
  end
end
