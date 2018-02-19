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

  """
  def repeat(text) do
    text = "Repeating " <> text
    text
  end
end
