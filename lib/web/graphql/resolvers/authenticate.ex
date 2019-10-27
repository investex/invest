defmodule Invest.Web.GraphQL.Resolvers.Authenticate do
  @behaviour Invest.Web.GraphQL.Resolver

  def resolve(_parent, args, _context) do
    Auth.authenticate(args)
  end
end
