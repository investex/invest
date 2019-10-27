defmodule Invest.Web.GraphQL.Types do
  use Absinthe.Schema.Notation

  import_types Invest.Web.GraphQL.Types.Error
  import_types Invest.Web.GraphQL.Types.User
end
