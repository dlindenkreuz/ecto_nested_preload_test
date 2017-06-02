defmodule NestedPreloadTest.Shop.Branch do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

  alias NestedPreloadTest.Shop.Branch


  schema "shop_branches" do
    field :title, :string
    has_many :products, NestedPreloadTest.Shop.Product
    has_many :categories, through: [:products, :category]

    timestamps()
  end

  @doc false
  def changeset(%Branch{} = branch, attrs) do
    branch
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end

  def with_categories(query) do
    from q in query,
      join: c in assoc(q, :categories),
      join: p in assoc(q, :products), on: p.branch_id == q.id,
      preload: [categories: {c, products: p}]
  end
end
