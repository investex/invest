defmodule Web.GraphQL.Schema do
  use Absinthe.Schema

  import_types Web.GraphQL.Types
  import_types Web.GraphQL.Queries
  import_types Web.GraphQL.Mutations

  query do
    import_fields :user_query
  end
end
