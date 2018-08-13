defmodule ChessEarth.EventResolver do
  alias ChessEarth.Events
  import ChessEarth.AuthPatterns

  def all(_args, _info) do
    {:ok, Events.list_events}
  end

  def create(args, current_user(id: id)) do
    Map.merge(args, %{user_id: id})
    |> Events.create_event
  end
  def create(_args, _info), do: {:error, "Not authorized"}

  def update(%{id: id, event: event_params}, current_user(id: user_id)) do
    event = Events.get_event!(id)
    case event.user_id do
      ^user_id -> Events.update_event(event, event_params)
      _ -> {:error, "Not authorized"}
    end
  end
  def update(_args, _info), do: {:error, "Not authorized"}

  def delete(%{id: id}, _info) do
    Events.get_event!(id)
    |> Events.delete_event
  end
end
