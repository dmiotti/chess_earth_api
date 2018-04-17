defmodule ChessEarth.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :token, :string
    has_many :events, ChessEarth.Events.Event

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password_hash, :token])
    |> validate_required([:name, :email, :password_hash, :token])
    |> unique_constraint(:email)
  end
end
