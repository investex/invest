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

  def middleware(middleware, _field, %{identifier: identifier}) when identifier in [:query, :mutation] do
    middleware ++ [Web.GraphQL.Middleware.ErrorHandling]
  end
  def middleware(middleware, _field, _object), do: middleware
end
