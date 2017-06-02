# Ecto NestedPreloadTest

> Related thread: https://elixirforum.com/t/nested-preload-with-condition/5605/

This is a Phoenix 1.3rc project.

## Setup

1. Install all deps as usual
2. Create Repo
3. `mix ecto.migrate`
4. `mix run priv/repo/seeds.exs` for generated test data
5. Check `localhost:4000/api/branches` for results. Every product has only one category and branch. However, all products appear throughout all categories and branches.

The erroneous query `with_categories` can be found in `lib/nested_preload_test/shop/branch.ex` and is used in `lib/nested_preload_test/shop/shop.ex` inside the `list_branches` function.
