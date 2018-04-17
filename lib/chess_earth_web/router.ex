defmodule ChessEarthWeb.Router do
  use ChessEarthWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ChessEarthWeb do
    pipe_through :api
  end
end
