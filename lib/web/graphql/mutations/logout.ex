defmodule Web.GraphQL.Mutations.Logout do
  use Absinthe.Schema.Notation

  object :logout_mutation do
    field :logout, type: :boolean do
      resolve &resolve/3
      middleware :auth
    end
  end

  def resolve(_parent, _args, %{context: %{current_user: current_user}}) do
    {:ok, true}
  end
  def resolve(_, _, _) do
    {:error, "Not logged in"}
  end

  def auth(%{value: true} = res, _config) do
    Map.update!(res, :context, fn ctx ->
      Map.put(ctx, :_logout, true)
    end)
  end
  def auth(res, _config), do: res
end
