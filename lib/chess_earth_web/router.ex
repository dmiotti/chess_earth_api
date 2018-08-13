defmodule ChessEarthWeb.Router do
  use ChessEarthWeb, :router

  pipeline :api do
    plug CORSPlug, origin: ["http://localhost:3000", "https://chess.earth"]
    plug :accepts, ["json"]
  end

  pipeline :graphql do
    plug ChessEarthWeb.Context
  end

  scope "/graphql" do
    pipe_through :api
    pipe_through :graphql

    forward "/", Absinthe.Plug,
      schema: ChessEarthWeb.Schema
  end

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: ChessEarthWeb.Schema
end
