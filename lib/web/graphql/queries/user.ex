defmodule Web.GraphQL.Queries.User do
  use Absinthe.Schema.Notation
  alias Persistence.{Repo, User}

  object :user_query do
    @desc "Get the `User` defined by the given `id`."
    field :user, non_null(:user_payload) do
      arg :id, non_null(:id)

      resolve &resolve/3
    end
  end

  def resolve(_parent, %{id: user_id}, _resolution) do
    {:ok, %{user: Repo.get(User, user_id), errors: []}}
  end
end
