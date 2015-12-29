defmodule Todo.ListTest do
  use ExUnit.Case

  alias Todo.List
  alias Todo.Item

  setup do
    {:ok, list} = List.start_link("Home")
    {:ok, list: list}
  end

  test ".items returns the todos on the list", %{list: list} do
    assert List.items(list) == []
  end

  test ".add adds an item to the list", %{list: list} do
    item = Item.new("Make coffee")

    List.add(list, item)
    assert List.items(list) == [item]
  end

  test ".update can mark an item complete", %{list: list} do
    item = Item.new("Compeleted Task")
    List.add(list, item)

    # Update the item
    item = %{item | description: "new", completed: true}
    List.update(list, item)

    # Assert that the item was updated
    assert List.items(list) == [item]
  end

end
