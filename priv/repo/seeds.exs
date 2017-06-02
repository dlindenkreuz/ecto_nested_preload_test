alias NestedPreloadTest.Shop.{Product, Branch, Category}
alias NestedPreloadTest.Repo

branches = for _ <- 1..2 do
  %Branch{
    title: Faker.Address.city,
  }
  |> Repo.insert!
end

categories = for _ <- 1..3 do
  %Category{
    title: Faker.Commerce.department,
  }
  |> Repo.insert!
end

for _ <- 1..20 do
  %Product{
    title: Faker.Commerce.product_name,
    branch: Enum.random(branches),
    category: Enum.random(categories),
  }
  |> Repo.insert!
end
