defmodule ChessEarth.Accounts.UserTest do
  use ExUnit.Case, async: true
  alias ChessEarth.Accounts.User

  @valid_attrs %{email: "pat@example.com", name: "Pat Example", password: "abcdef123#?q[p12"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
