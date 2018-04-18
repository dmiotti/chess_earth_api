defmodule ChessEarth.EventResolver do
  alias ChessEarth.Events
  import ChessEarth.AuthPatterns

  def all(_args, _info) do
    Events.list_events
  end

  def create(args, current_user(id: id)) do
    Map.merge(args, %{user_id: id})
    |> Events.create_event
  end
  def create(_args, _info) do
    {:error, "Not authorized"}
  end

  def update(%{id: id, event: event_params}, _info) do
    Events.get_event!(id)
    |> Events.update_event(event_params)
  end

  def delete(%{id: id}, _info) do
    Events.get_event!(id)
    |> Events.delete_event
  end
end