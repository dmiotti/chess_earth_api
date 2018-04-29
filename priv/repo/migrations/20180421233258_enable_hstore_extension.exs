defmodule ChessEarth.Repo.Migrations.EnableHstoreExtension do
  use Ecto.Migration

  def change do
    execute ~s(CREATE EXTENSION IF NOT EXISTS "hstore")
  end
end
