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

  test "0 converts to zero" do
    assert Repeater.repeat(0) == "Repeating zero"
  end

  test "case no-repeat" do
    assert Repeater.repeat("no-repeat") == "Can't repeat"
  end

  test "case one repeat" do
    assert Repeater.repeat("repeat") == "Only one repeat allowed"
  end

  test "cond negative" do
    assert Repeater.repeat(-7) == "Repeating negative"
  end

  test "struct matching property" do
    assert Repeater.repeat(%Repeater.Config{text: "random"}) == "Repeating random"
  end

  test "struct matching" do
    assert Repeater.repeat(%Repeater.Match{}) == "Repeating struct-match"
  end
end
