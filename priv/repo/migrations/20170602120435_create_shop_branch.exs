defmodule NestedPreloadTest.Repo.Migrations.CreateNestedPreloadTest.Shop.Branch do
  use Ecto.Migration

  def change do
    create table(:shop_branches) do
      add :title, :string

      timestamps()
    end

  end
end
