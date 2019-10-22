defmodule Web.GraphQL.Resolvers.Authenticate do
  @behaviour Web.GraphQL.Resolver

  def resolve(_parent, args, _context) do
    Auth.authenticate(args)
  end
end
