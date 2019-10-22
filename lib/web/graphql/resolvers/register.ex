defmodule Web.GraphQL.Resolvers.Register do
  @behaviour Web.GraphQL.Resolver

  def resolve(_parent, args, _context) do
    Auth.register(args)
  end
end
