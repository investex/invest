defmodule Web.GraphQL.Types do
  use Absinthe.Schema.Notation

  import_types Web.GraphQL.Types.Error
  import_types Web.GraphQL.Types.User
end
