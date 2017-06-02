defmodule NestedPreloadTest.Repo.Migrations.CreateNestedPreloadTest.Shop.Product do
  use Ecto.Migration

  def change do
    create table(:shop_products) do
      add :title, :string
      add :category_id, references(:shop_categories, on_delete: :nothing)
      add :branch_id, references(:shop_branches, on_delete: :nothing)

      timestamps()
    end
  end
end
