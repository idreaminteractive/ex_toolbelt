defmodule ExToolbeltTest do
  use ExUnit.Case
  doctest ExToolbelt

  test "greets the world" do
    assert ExToolbelt.hello() == :world
  end
end
