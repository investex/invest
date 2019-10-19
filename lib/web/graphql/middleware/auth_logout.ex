defmodule Web.GraphQL.Middleware.AuthLogout do
  @behaviour Absinthe.Middleware

  def call(%{value: true} = res, _opts) do
    Map.update!(res, :context, fn ctx ->
      Map.put(ctx, :_logout, true)
    end)
  end
  def call(res, _opts), do: res
end
