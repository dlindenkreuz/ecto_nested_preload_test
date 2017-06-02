defmodule NestedPreloadTest.Web.BranchView do
  use NestedPreloadTest.Web, :view
  alias NestedPreloadTest.Web.{BranchView, CategoryView, ProductView}

  def render("index.json", %{branches: branches}) do
    %{data: render_many(branches, BranchView, "branch.json")}
  end

  def render("show.json", %{branch: branch}) do
    %{data: render_one(branch, BranchView, "branch.json")}
  end

  def render("branch.json", %{branch: branch}) do
    IO.inspect branch.categories
    %{title: branch.title,
      categories: render_many(branch.categories, CategoryView, "category.json")}
  end
end
