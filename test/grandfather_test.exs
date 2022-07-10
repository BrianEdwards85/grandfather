defmodule GrandfatherTest do
  use ExUnit.Case
  doctest Grandfather

  test "greets the world" do
    assert Grandfather.hello() == :world
  end
end
