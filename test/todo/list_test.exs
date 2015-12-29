defmodule Todo.ListTest do
  use ExUnit.Case

  alias Todo.List

  setup do
    {:ok, list} = List.start_link("Home")
    {:ok, list: list}
  end

  test ".items returns the todos on the list", %{list: list} do
    assert List.items(list) == []
  end


end
