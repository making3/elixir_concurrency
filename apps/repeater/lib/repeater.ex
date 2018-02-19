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

      iex> Repeater.repeat("5")
      "Repeating 5"

  """
  def repeat(text) when is_integer(text) do
    text
    |> Integer.to_string()
    |> repeat()
  end

  def repeat(text) do
    text = "Repeating " <> text
    text
  end
end
