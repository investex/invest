defmodule Web.GraphQL.Resolvers.Register do
  def resolve(_parent, args, _context) do
    Auth.register(args)
  end
end
