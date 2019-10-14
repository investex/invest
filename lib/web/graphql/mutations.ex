defmodule Web.GraphQL.Mutations do
  use Absinthe.Schema.Notation

  import_types Web.GraphQL.Mutations.Register
  import_types Web.GraphQL.Mutations.Logout
  import_types Web.GraphQL.Mutations.Authenticate
end
