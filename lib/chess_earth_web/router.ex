defmodule ChessEarthWeb.Router do
  use ChessEarthWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChessEarthWeb do
    pipe_through :api
  end

  forward "/api", Absinthe.Plug,
    schema: ChessEarthWeb.Schema

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: ChessEarthWeb.Schema
end
