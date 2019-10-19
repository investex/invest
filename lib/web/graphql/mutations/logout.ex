defmodule Web.GraphQL.Mutations.Logout do
  use Absinthe.Schema.Notation
  alias Web.GraphQL.Middleware.AuthLogout
  alias Web.GraphQL.Resolvers.Logout

  object :logout_mutation do
    field :logout, type: :boolean do
      resolve &Logout.resolve/3
      middleware AuthLogout
    end
  end
end
