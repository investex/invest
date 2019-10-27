defmodule Invest.Web.GraphQL.Middleware.AuthLogin do
  @behaviour Absinthe.Middleware

  alias Persistence.User

  def call(%{value: %User{} = user} = res, _opts) do
    Map.update!(res, :context, fn ctx ->
      Map.put(ctx, :user_id, user.id)
    end)
  end
  def call(res, _opts), do: res
end
