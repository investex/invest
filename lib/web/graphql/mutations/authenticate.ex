defmodule Web.GraphQL.Mutations.Authenticate do
  use Absinthe.Schema.Notation
  alias Persistence.User

  object :authenticate_mutation do
    field :authenticate, type: :user do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &resolve/3
      middleware :auth
    end
  end

  def resolve(_parent, args, _context) do
    Auth.authenticate(args)
  end

  def auth(%{value: %User{} = user} = res, _config) do
    # require IEx; IEx.pry
    Map.update!(res, :context, fn ctx ->
      Map.put(ctx, :user_id, user.id)
    end)
  end
  def auth(res, _config), do: res
end
