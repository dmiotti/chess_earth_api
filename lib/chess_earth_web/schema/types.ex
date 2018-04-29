defmodule ChessEarthWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: ChessEarth.Repo
  use Timex

  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :events, non_null(list_of(non_null(:event))), resolve: assoc(:events)
  end

  object :event do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :start_at, non_null(:date)
    field :end_at, non_null(:date)
    field :address, :address
    field :user, non_null(:user), resolve: assoc(:user)
  end

  object :address do
    field :formatted_address, :string
    field :street_number, :string
    field :street, :string
    field :zip_code, :string
    field :country, :string
    field :country_code, :string
    field :city, :string
    field :lat, :string
    field :lng, :string
  end

  object :session do
    field :token, non_null(:string)
  end
end