defmodule Web.GraphQL.Queries.Me do
  use Absinthe.Schema.Notation

  object :me_query do
    @desc "Get the logged in `User`."
    field :me, :user do
      resolve &resolve/3
    end
  end

  def resolve(_parent, _args, %{context: %{current_user: current_user}}) do
    {:ok, current_user}
  end
  def resolve(_, _, _) do
    {:error, "Not logged in"}
  end
end
