defmodule ChessEarth.Repo.Migrations.AddAddressToEvents do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :address, :map
    end
  end
end
