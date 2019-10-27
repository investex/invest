defmodule Invest.Web.GraphQL.Resolvers.Me do
  @behaviour Invest.Web.GraphQL.Resolver
  use Rop

  def resolve(_parent, _args, %{context: %{current_user: user}}) do
    ok(user)
  end
  def resolve(_, _, _) do
    err("Not logged in")
  end
end
