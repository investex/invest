defmodule Invest.Web.GraphQL.Mutations do
  use Absinthe.Schema.Notation

  import_types Invest.Web.GraphQL.Mutations.Register
  import_types Invest.Web.GraphQL.Mutations.Logout
  import_types Invest.Web.GraphQL.Mutations.Authenticate
end
