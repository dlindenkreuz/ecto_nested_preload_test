defmodule NestedPreloadTest.ShopTest do
  use NestedPreloadTest.DataCase

  alias NestedPreloadTest.Shop

  describe "categories" do
    alias NestedPreloadTest.Shop.Category

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shop.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Shop.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Shop.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Shop.create_category(@valid_attrs)
      assert category.title == "some title"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shop.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, category} = Shop.update_category(category, @update_attrs)
      assert %Category{} = category
      assert category.title == "some updated title"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Shop.update_category(category, @invalid_attrs)
      assert category == Shop.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Shop.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Shop.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Shop.change_category(category)
    end
  end

  describe "products" do
    alias NestedPreloadTest.Shop.Product

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shop.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Shop.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Shop.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Shop.create_product(@valid_attrs)
      assert product.title == "some title"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shop.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, product} = Shop.update_product(product, @update_attrs)
      assert %Product{} = product
      assert product.title == "some updated title"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Shop.update_product(product, @invalid_attrs)
      assert product == Shop.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Shop.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Shop.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Shop.change_product(product)
    end
  end

  describe "branches" do
    alias NestedPreloadTest.Shop.Branch

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def branch_fixture(attrs \\ %{}) do
      {:ok, branch} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shop.create_branch()

      branch
    end

    test "list_branches/0 returns all branches" do
      branch = branch_fixture()
      assert Shop.list_branches() == [branch]
    end

    test "get_branch!/1 returns the branch with given id" do
      branch = branch_fixture()
      assert Shop.get_branch!(branch.id) == branch
    end

    test "create_branch/1 with valid data creates a branch" do
      assert {:ok, %Branch{} = branch} = Shop.create_branch(@valid_attrs)
      assert branch.title == "some title"
    end

    test "create_branch/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shop.create_branch(@invalid_attrs)
    end

    test "update_branch/2 with valid data updates the branch" do
      branch = branch_fixture()
      assert {:ok, branch} = Shop.update_branch(branch, @update_attrs)
      assert %Branch{} = branch
      assert branch.title == "some updated title"
    end

    test "update_branch/2 with invalid data returns error changeset" do
      branch = branch_fixture()
      assert {:error, %Ecto.Changeset{}} = Shop.update_branch(branch, @invalid_attrs)
      assert branch == Shop.get_branch!(branch.id)
    end

    test "delete_branch/1 deletes the branch" do
      branch = branch_fixture()
      assert {:ok, %Branch{}} = Shop.delete_branch(branch)
      assert_raise Ecto.NoResultsError, fn -> Shop.get_branch!(branch.id) end
    end

    test "change_branch/1 returns a branch changeset" do
      branch = branch_fixture()
      assert %Ecto.Changeset{} = Shop.change_branch(branch)
    end
  end
end
