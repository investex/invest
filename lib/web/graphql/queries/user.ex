defmodule Web.GraphQL.Queries.User do
  use Absinthe.Schema.Notation
  alias Persistence.User
  alias Web.GraphQL.Resolvers.GetRecord

  object :user_query do
    @desc "Get the `User` defined by the given `id`."
    field :user, :user do
      arg :id, non_null(:id)

      resolve GetRecord.resolve(User)
    end
  end
end
