defmodule NestedPreloadTest.Repo.Migrations.CreateNestedPreloadTest.Shop.Category do
  use Ecto.Migration

  def change do
    create table(:shop_categories) do
      add :title, :string

      timestamps()
    end

  end
end
