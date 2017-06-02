defmodule NestedPreloadTest.Shop.Category do
  use Ecto.Schema
  import Ecto.Changeset
  alias NestedPreloadTest.Shop.Category


  schema "shop_categories" do
    field :title, :string
    has_many :products, NestedPreloadTest.Shop.Product

    timestamps()
  end

  @doc false
  def changeset(%Category{} = category, attrs) do
    category
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
