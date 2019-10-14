defmodule Web.GraphQL.Queries.User do
  use Absinthe.Schema.Notation
  alias Persistence.{Repo, User}

  object :user_query do
    @desc "Get the `User` defined by the given `id`."
    field :user, :user do
      arg :id, non_null(:id)

      resolve &resolve/3
    end
  end

  def resolve(_parent, %{id: user_id}, _resolution) do
    User
    |> Repo.get(user_id)
    |> process_response
  end

  defp process_response(record) when record == nil do
    {:error, "Record not found"}
  end
  defp process_response(record) do
    {:ok, record}
  end
end
