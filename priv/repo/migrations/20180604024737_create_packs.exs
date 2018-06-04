defmodule QueryHub.Repo.Migrations.CreatePacks do
  use Ecto.Migration

  def change do
    create table(:packs) do
      add(:name, :string)
      add(:description, :string)

      timestamps()
    end
  end
end
