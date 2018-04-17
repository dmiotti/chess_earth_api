defmodule ChessEarth.EventResolver do
  alias ChessEarth.Events

  def all(_args, _info) do
    {:ok, Events.list_events()}
  end

  def create(args, _info) do
    Events.create_event(args)
  end
end