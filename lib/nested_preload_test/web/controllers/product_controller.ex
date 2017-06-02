defmodule NestedPreloadTest.Web.ProductController do
  use NestedPreloadTest.Web, :controller

  alias NestedPreloadTest.Shop
  alias NestedPreloadTest.Shop.Product

  action_fallback NestedPreloadTest.Web.FallbackController

  def index(conn, _params) do
    products = Shop.list_products()
    render(conn, "index.json", products: products)
  end

  def create(conn, %{"product" => product_params}) do
    with {:ok, %Product{} = product} <- Shop.create_product(product_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", product_path(conn, :show, product))
      |> render("show.json", product: product)
    end
  end

  def show(conn, %{"id" => id}) do
    product = Shop.get_product!(id)
    render(conn, "show.json", product: product)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Shop.get_product!(id)

    with {:ok, %Product{} = product} <- Shop.update_product(product, product_params) do
      render(conn, "show.json", product: product)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Shop.get_product!(id)
    with {:ok, %Product{}} <- Shop.delete_product(product) do
      send_resp(conn, :no_content, "")
    end
  end
end
