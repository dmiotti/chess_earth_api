defmodule ChessEarthWeb.Schema do
  use Absinthe.Schema
  import_types ChessEarthWeb.Schema.Types
  import_types Absinthe.Type.Custom

  query do
    field :events, non_null(list_of(non_null(:event))) do
      resolve &ChessEarth.EventResolver.all/2
    end

    field :users, non_null(list_of(non_null(:user))) do
      resolve &ChessEarth.UserResolver.all/2
    end

    field :user, type: non_null(:user) do
      arg :id, non_null(:id)
      resolve &ChessEarth.UserResolver.find/2
    end
  end

  input_object :update_event_params do
    field :name, non_null(:string)
    field :start_at, non_null(:date)
    field :end_at, non_null(:date)
  end

  input_object :update_user_params do
    field :name, :string
    field :email, :string
    field :password, :string
    field :address, :address_params
  end

  input_object :address_params do
    field :formatted_address, :string
    field :street_number, :string
    field :street, :string
    field :zip_code, :string
    field :country, non_null(:string)
    field :country_code, non_null(:string)
    field :city, non_null(:string)
    field :lat, non_null(:string)
    field :lng, non_null(:string)
  end

  mutation do
    field :create_user, type: non_null(:session) do
      arg :name, non_null(:string)
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      resolve &ChessEarth.UserResolver.create/2
    end

    field :login, type: non_null(:session) do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      resolve &ChessEarth.UserResolver.login/2
    end

    field :update_user, type: non_null(:user) do
      arg :id, non_null(:id)
      arg :user, :update_user_params
      resolve &ChessEarth.UserResolver.update/2
    end

    field :create_event, type: non_null(:event) do
      arg :name, non_null(:string)
      arg :start_at, non_null(:date)
      arg :end_at, non_null(:date)
      arg :address, :address_params
      resolve &ChessEarth.EventResolver.create/2
    end

    field :update_event, type: non_null(:event) do
      arg :id, non_null(:id)
      arg :event, :update_event_params
      resolve &ChessEarth.EventResolver.update/2
    end

    field :delete_event, type: non_null(:event) do
      arg :id, non_null(:id)
      resolve &ChessEarth.EventResolver.delete/2
    end
  end
end