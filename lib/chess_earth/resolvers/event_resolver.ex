defmodule ChessEarth.EventResolver do
  alias ChessEarth.Events
  import Ecto.Query, only: [where: 2]
  alias ChessEarth.Events.Event
  alias ChessEarth.Repo

  def all(_args, %{context: %{current_user: %{id: id}}}) do
    events =
      Event
      |> where(user_id: ^id)
      |> Repo.all
    {:ok, events}
  end
  def all(_args, _info) do
    {:error, "Not authorized"}
  end

  def create(args, _info) do
    Events.create_event(args)
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