defmodule ChessEarth.Accounts.AccountsTest do
  use ExUnit.Case, async: true
  alias ChessEarth.Accounts

  @user_attrs %{email: "pat@example.com", name: "Pat Example", password: "abcdef123#?q[p12"}

  test "create user" do
    {:ok, user} = Accounts.create_user(@user_attrs)
    saved_user = Accounts.get_user!(user.id)
    assert user.id == saved_user.id
    assert user.name == saved_user.name
  end
end
