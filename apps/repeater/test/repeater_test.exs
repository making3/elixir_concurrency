defmodule RepeaterTest do
  use ExUnit.Case
  doctest Repeater

  test "repeats text" do
    assert Repeater.repeat("test123") == "test123"
  end
end
