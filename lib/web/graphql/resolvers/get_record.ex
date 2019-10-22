defmodule Web.GraphQL.Resolvers.GetRecord do
  alias Persistence.Repo

  def resolve(module) do
    fn (_parent, %{id: id}, _context) ->
      module
      |> Repo.fetch(id)
    end
  end
end
