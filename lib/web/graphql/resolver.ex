defmodule Web.GraphQL.Resolver do
  @callback resolve(map(), map(), %Absinthe.Resolution{}) :: {:ok, term} | {:error, term}
end
