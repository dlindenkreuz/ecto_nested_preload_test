defmodule NestedPreloadTest.Web.ProductControllerTest do
  use NestedPreloadTest.Web.ConnCase

  alias NestedPreloadTest.Shop
  alias NestedPreloadTest.Shop.Product

  @create_attrs %{title: "some title"}
  @update_attrs %{title: "some updated title"}
  @invalid_attrs %{title: nil}

  def fixture(:product) do
    {:ok, product} = Shop.create_product(@create_attrs)
    product
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, product_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "creates product and renders product when data is valid", %{conn: conn} do
    conn = post conn, product_path(conn, :create), product: @create_attrs
    assert %{"id" => id} = json_response(conn, 201)["data"]

    conn = get conn, product_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "title" => "some title"}
  end

  test "does not create product and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, product_path(conn, :create), product: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates chosen product and renders product when data is valid", %{conn: conn} do
    %Product{id: id} = product = fixture(:product)
    conn = put conn, product_path(conn, :update, product), product: @update_attrs
    assert %{"id" => ^id} = json_response(conn, 200)["data"]

    conn = get conn, product_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "title" => "some updated title"}
  end

  test "does not update chosen product and renders errors when data is invalid", %{conn: conn} do
    product = fixture(:product)
    conn = put conn, product_path(conn, :update, product), product: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen product", %{conn: conn} do
    product = fixture(:product)
    conn = delete conn, product_path(conn, :delete, product)
    assert response(conn, 204)
    assert_error_sent 404, fn ->
      get conn, product_path(conn, :show, product)
    end
  end
end
