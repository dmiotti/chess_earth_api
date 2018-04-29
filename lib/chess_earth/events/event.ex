defmodule ChessEarth.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset


  schema "events" do
    field :name, :string
    field :start_at, Timex.Ecto.Date
    field :end_at, Timex.Ecto.Date
    field :address, :map

    belongs_to :user, ChessEarth.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :start_at, :end_at, :user_id, :address])
    |> validate_required([:name, :start_at, :end_at, :address])
  end

  def create_changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :start_at, :end_at, :user_id, :address])
    |> validate_required([:name, :start_at, :end_at, :user_id, :address])
  end

  def update_changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :start_at, :end_at, :user_id, :address])
  end
end
