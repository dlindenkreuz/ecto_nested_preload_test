defmodule NestedPreloadTest.Web.CategoryView do
  use NestedPreloadTest.Web, :view
  alias NestedPreloadTest.Web.{CategoryView, ProductView}

  def render("index.json", %{categories: categories}) do
    %{data: render_many(categories, CategoryView, "category.json")}
  end

  def render("show.json", %{category: category}) do
    %{data: render_one(category, CategoryView, "category.json")}
  end

  def render("category.json", %{category: category}) do
    %{title: category.title,
      products: Enum.map(category.products, &(&1.id))}
  end
end
