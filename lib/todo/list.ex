defmodule Todo.List do
  use GenServer

  def name(list) do
    GenServer.call(list, :name)
  end

  def items(list) do
    GenServer.call(list, :items)
  end

  ###
  # GenServer API
  ###

  def start_link(name) do
    GenServer.start_link(__MODULE__, name)
  end

  def init(name) do
    state = %{name: name, items: []}
    {:ok, state}
  end

  def handle_call(:name, _from, state) do
    {:reply, state.name, state}
  end

  def handle_call(:items, _from, state) do
    {:reply, state.items, state}
  end


end
