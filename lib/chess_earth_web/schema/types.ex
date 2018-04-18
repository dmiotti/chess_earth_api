defmodule ChessEarthWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: ChessEarth.Repo
  use Timex

  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :events, list_of(:event), resolve: assoc(:events)
  end

  object :event do
    field :id, :id
    field :name, :string
    field :start_at, :date
    field :end_at, :date
    field :user, :user, resolve: assoc(:users)
  end

  object :session do
    field :token, :string
  end
end