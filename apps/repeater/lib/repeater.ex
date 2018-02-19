defmodule Repeater do
  @moduledoc """
  Contains functions for repeating things
  """

  @doc """
  Repeats text

  ## Parameters

    - text: Text to repeat

  ## Examples

      iex> Repeater.repeat("test!")
      "Repeating test!"

      iex> Repeater.repeat("more text")
      "Repeating more text"

      iex> Repeater.repeat(5)
      "Repeating 5"

      iex> Repeater.repeat(0)
      "Repeating zero"

      iex> Repeater.repeat("no-repeat")
      "Can't repeat"

      iex> Repeater.repeat("repeat")
      "Only one repeat allowed"

      iex> Repeater.repeat(-15)
      "Repeating negative"
  """
  def repeat(0) do
    repeat("zero")
  end

  def repeat(text) when is_integer(text) do
    cond do
      text < 0 ->
        repeat("negative")
      true ->
        text
        |> Integer.to_string()
        |> repeat()
    end
  end

  def repeat(text) do
    case text do
      "no-repeat" -> "Can't repeat"
      "repeat" -> "Only one repeat allowed"
      _ -> "Repeating " <> text
    end
  end
end
