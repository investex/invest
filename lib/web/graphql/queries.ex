defmodule Web.GraphQL.Queries do
  use Absinthe.Schema.Notation

  import_types Web.GraphQL.Queries.User
  import_types Web.GraphQL.Queries.Me
end
