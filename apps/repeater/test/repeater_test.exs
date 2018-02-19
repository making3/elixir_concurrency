defmodule RepeaterTest do
  use ExUnit.Case
  doctest Repeater

  test "repeats text" do
    assert Repeater.repeat("test123") == "Repeating test123"
  end

  test "immutable repeat" do
    text = "foo"
    assert Repeater.repeat(text) == "Repeating #{text}"
    assert text == "foo"
  end

  test "number converts to string" do
    assert Repeater.repeat(123) == "Repeating 123"
  end
end
