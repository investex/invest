defmodule Invest.Web.GraphQL.Queries.Me do
  use Absinthe.Schema.Notation
  alias Invest.Web.GraphQL.Resolvers.Me

  object :me_query do
    @desc "Get the logged in `User`."
    field :me, :user do
      resolve &Me.resolve/3
    end
  end
end
