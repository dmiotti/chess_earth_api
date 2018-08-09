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
    field :name, :string, resolve: key("name")
    field :street_number, :string, resolve: key("street_number")
    field :street, non_null(:string), resolve: key("street")
    field :zip_code, non_null(:string), resolve: key("zip_code")
    field :country, non_null(:string), resolve: key("country")
    field :country_code, non_null(:string), resolve: key("country_code")
    field :city, non_null(:string), resolve: key("city")
    field :lat, non_null(:string), resolve: key("lat")
    field :lng, non_null(:string), resolve: key("lng")
  end

  object :session do
    field :token, non_null(:string)
  end

  def key(key_name) do
    fn thing, _, _ ->
      {:ok, Map.get(thing, key_name)}
    end
  end
end
