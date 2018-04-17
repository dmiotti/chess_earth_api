defmodule ChessEarth.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :start_at, :date
      add :end_at, :date
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:events, [:user_id])
  end
end
