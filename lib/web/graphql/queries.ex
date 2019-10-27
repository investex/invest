defmodule Invest.Web.GraphQL.Queries do
  use Absinthe.Schema.Notation

  import_types Invest.Web.GraphQL.Queries.User
  import_types Invest.Web.GraphQL.Queries.Me
end
