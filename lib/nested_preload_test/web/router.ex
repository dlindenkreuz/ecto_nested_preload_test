defmodule NestedPreloadTest.Web.Router do
  use NestedPreloadTest.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", NestedPreloadTest.Web do
    pipe_through :api
    resources "/products", ProductController, except: [:new, :edit]
    resources "/categories", CategoryController, except: [:new, :edit]
    resources "/branches", BranchController, except: [:new, :edit]
  end
end
