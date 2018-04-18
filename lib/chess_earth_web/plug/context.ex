defmodule ChessEarthWeb.Context do
  @behaviour Plug

  import Plug.Conn
  import Ecto.Query, only: [where: 2]

  alias ChessEarth.Repo
  alias ChessEarth.Accounts.User

  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    put_private(conn, :absinthe, %{context: context})
  end

  defp build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, curent_user} <- authorize(token) do
      %{curent_user: curent_user}
    else
      _ -> %{}
    end
  end

  defp authorize(token) do
    User
    |> where(token: ^token)
    |> Repo.one
    |> case do
      nil -> {:error, "invalid authorization token"}
      user -> {:ok, user}
    end
  end
end