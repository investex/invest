defmodule Web.GraphQL.Resolvers.Logout do
  use Rop

  def resolve(_parent, _args, %{context: %{current_user: _}}) do
    ok(true)
  end
  def resolve(_, _, _) do
    err("Not logged in")
  end
end
