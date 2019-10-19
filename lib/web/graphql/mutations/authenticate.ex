defmodule Web.GraphQL.Mutations.Authenticate do
  use Absinthe.Schema.Notation
  alias Web.GraphQL.Middleware.AuthLogin
  alias Web.GraphQL.Resolvers.Authenticate

  object :authenticate_mutation do
    field :authenticate, type: :user do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &Authenticate.resolve/3
      middleware AuthLogin
    end
  end
end
