defmodule NestedPreloadTest.Shop.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias NestedPreloadTest.Shop.Product


  schema "shop_products" do
    field :title, :string
    belongs_to :branch, NestedPreloadTest.Shop.Branch
    belongs_to :category, NestedPreloadTest.Shop.Category

    timestamps()
  end

  @doc false
  def changeset(%Product{} = product, attrs) do
    product
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
