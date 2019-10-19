defmodule Web.GraphQL.Mutations.Register do
  use Absinthe.Schema.Notation
  alias Web.GraphQL.Middleware.AuthLogin
  alias Web.GraphQL.Resolvers.Register

  object :register_mutation do
    field :register, type: :user do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &Register.resolve/3
      middleware AuthLogin
    end
  end
end
