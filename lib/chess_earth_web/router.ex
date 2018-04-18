defmodule ChessEarthWeb.Router do
  use ChessEarthWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :graphql do
    plug ChessEarthWeb.Context
  end

  scope "/", ChessEarthWeb do
    pipe_through :api
  end

  scope "/api" do
    pipe_through :graphql

    forward "/", Absinthe.Plug,
      schema: ChessEarthWeb.Schema
  end

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: ChessEarthWeb.Schema
end
