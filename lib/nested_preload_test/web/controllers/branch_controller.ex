defmodule NestedPreloadTest.Web.BranchController do
  use NestedPreloadTest.Web, :controller

  alias NestedPreloadTest.Shop
  alias NestedPreloadTest.Shop.Branch

  action_fallback NestedPreloadTest.Web.FallbackController

  def index(conn, _params) do
    branches = Shop.list_branches()
    render(conn, "index.json", branches: branches)
  end

  def create(conn, %{"branch" => branch_params}) do
    with {:ok, %Branch{} = branch} <- Shop.create_branch(branch_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", branch_path(conn, :show, branch))
      |> render("show.json", branch: branch)
    end
  end

  def show(conn, %{"id" => id}) do
    branch = Shop.get_branch!(id)
    render(conn, "show.json", branch: branch)
  end

  def update(conn, %{"id" => id, "branch" => branch_params}) do
    branch = Shop.get_branch!(id)

    with {:ok, %Branch{} = branch} <- Shop.update_branch(branch, branch_params) do
      render(conn, "show.json", branch: branch)
    end
  end

  def delete(conn, %{"id" => id}) do
    branch = Shop.get_branch!(id)
    with {:ok, %Branch{}} <- Shop.delete_branch(branch) do
      send_resp(conn, :no_content, "")
    end
  end
end
