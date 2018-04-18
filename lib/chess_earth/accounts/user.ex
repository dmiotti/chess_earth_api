defmodule ChessEarth.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias ChessEarth.Accounts.User
  alias ChessEarth.Repo

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :token, :string
    has_many :events, ChessEarth.Events.Event

    timestamps()
  end

  @required_fields ~w(email name password)
  @optional_fields ~w()


  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, @required_fields, @optional_fields)
    |> validate_required([:name, :email])
  end

  def update_changeset(%User{} = user, params \\ %{}) do
    user
    |> cast(params, [:name, :email], [:password])
    |> validate_required([:name, :email])
    |> put_pass_hash
  end

  def registration_changeset(%User{} = user, params \\ %{}) do
    user
    |> cast(params, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> put_pass_hash
  end

  def store_token_changeset(%User{} = user, params \\ %{}) do
    user
    |> cast(params, [:token])
    |> validate_required([:token])
    |> put_pass_hash
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        changeset
    end
  end

  def authenticate(params) do
    user = Repo.get_by(User, email: String.downcase(params.email))
    case check_password(user, params.password) do
      true -> {:ok, user}
      _ -> {:error, "Incorrect login credentials"}
    end
  end

  defp check_password(user, password) do
    case user do
      nil -> false
      _ -> Comeonin.Bcrypt.checkpw(password, user.password_hash)
    end
  end
end
