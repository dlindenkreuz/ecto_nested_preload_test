defmodule NestedPreloadTest.Web.BranchControllerTest do
  use NestedPreloadTest.Web.ConnCase

  alias NestedPreloadTest.Shop
  alias NestedPreloadTest.Shop.Branch

  @create_attrs %{title: "some title"}
  @update_attrs %{title: "some updated title"}
  @invalid_attrs %{title: nil}

  def fixture(:branch) do
    {:ok, branch} = Shop.create_branch(@create_attrs)
    branch
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, branch_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "creates branch and renders branch when data is valid", %{conn: conn} do
    conn = post conn, branch_path(conn, :create), branch: @create_attrs
    assert %{"id" => id} = json_response(conn, 201)["data"]

    conn = get conn, branch_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "title" => "some title"}
  end

  test "does not create branch and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, branch_path(conn, :create), branch: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates chosen branch and renders branch when data is valid", %{conn: conn} do
    %Branch{id: id} = branch = fixture(:branch)
    conn = put conn, branch_path(conn, :update, branch), branch: @update_attrs
    assert %{"id" => ^id} = json_response(conn, 200)["data"]

    conn = get conn, branch_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "title" => "some updated title"}
  end

  test "does not update chosen branch and renders errors when data is invalid", %{conn: conn} do
    branch = fixture(:branch)
    conn = put conn, branch_path(conn, :update, branch), branch: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen branch", %{conn: conn} do
    branch = fixture(:branch)
    conn = delete conn, branch_path(conn, :delete, branch)
    assert response(conn, 204)
    assert_error_sent 404, fn ->
      get conn, branch_path(conn, :show, branch)
    end
  end
end
