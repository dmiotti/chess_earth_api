defmodule ChessEarthWeb.Schema do
  use Absinthe.Schema
  import_types ChessEarthWeb.Schema.Types
  import_types Absinthe.Type.Custom

  query do
    field :events, list_of(:event) do
      resolve &ChessEarth.EventResolver.all/2
    end

    field :users, list_of(:user) do
      resolve &ChessEarth.UserResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &ChessEarth.UserResolver.find/2
    end
  end

  mutation do
    field :create_event, type: :event do
      arg :name, non_null(:string)
      arg :start_at, non_null(:datetime)
      arg :end_at, non_null(:datetime)
      arg :user_id, non_null(:string)

      resolve &ChessEarth.EventResolver.create/2
    end
  end
end