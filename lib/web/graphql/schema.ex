defmodule Web.GraphQL.Schema do
  use Absinthe.Schema

  import_types Web.GraphQL.Types
  import_types Web.GraphQL.Queries
  import_types Web.GraphQL.Mutations

  query do
    import_fields :user_query
    import_fields :me_query
  end

  mutation do
    import_fields :register_mutation
    import_fields :logout_mutation
    import_fields :authenticate_mutation
  end
end
