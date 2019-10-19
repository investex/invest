defmodule Web.GraphQL.Resolvers.Authenticate do
  def resolve(_parent, args, _context) do
    Auth.authenticate(args)
  end
end
