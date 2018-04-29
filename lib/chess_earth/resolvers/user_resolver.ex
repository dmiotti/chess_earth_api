defmodule ChessEarth.UserResolver do
  alias ChessEarth.Accounts
  import ChessEarth.AuthPatterns

  def all(_args, _info) do
    {:ok, Accounts.list_users}
  end

  def find(%{id: id}, _info) do
    case Accounts.get_user!(id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end

  def create(args, _info) do
    case Accounts.create_user(args) do
      {:ok, user} ->
        with {:ok, jwt, _} <- ChessEarth.Guardian.encode_and_sign(user),
             {:ok, _} <- ChessEarth.Accounts.store_user(user, jwt)
        do
          {:ok, %{token: jwt}}
        end
    end
  end

  def update(%{id: id, user: user_params}, current_user(id: user_id)) do
    user = Accounts.get_user!(id)
    case user.id do
      ^user_id -> Accounts.update_user(user, user_params)
      _ -> {:error, "Not Authorized"}
    end
  end

  def login(params, _info) do
    with {:ok, user} <- ChessEarth.Accounts.User.authenticate(params),
         {:ok, jwt, _} <- ChessEarth.Guardian.encode_and_sign(user),
         {:ok, _} <- ChessEarth.Accounts.store_user(user, jwt)
    do
      {:ok, %{token: jwt}}
    end
  end
end