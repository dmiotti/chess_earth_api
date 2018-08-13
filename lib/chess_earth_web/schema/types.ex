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
    field :name, :string, resolve: hstore_get(:name)
    field :street_number, :string, resolve: hstore_get(:street_number)
    field :street, non_null(:string), resolve: hstore_get(:street)
    field :zip_code, non_null(:string), resolve: hstore_get(:zip_code)
    field :country, non_null(:string), resolve: hstore_get(:country)
    field :country_code, non_null(:string), resolve: hstore_get(:country_code)
    field :city, non_null(:string), resolve: hstore_get(:city)
    field :lat, non_null(:string), resolve: hstore_get(:lat)
    field :lng, non_null(:string), resolve: hstore_get(:lng)
  end

  object :session do
    field :token, non_null(:string)
  end

  def hstore_get(key) do
    fn hstore, _, _ ->
      {:ok, Map.get(hstore, key, Map.get(hstore, Atom.to_string(key)))}
    end
  end
end
