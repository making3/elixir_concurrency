defmodule Repeater.Loop do
  def start(text) do
    IO.puts(text)
    :timer.sleep(5000)

    start(text)
  end

  def async(text) do
    spawn(Repeater.Loop, :start, [text])
  end
end
