defmodule Web.GraphQL.Mutations.Register do
  use Absinthe.Schema.Notation
  alias Persistence.User

  object :register_mutation do
    field :register, type: :user do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &resolve/3
      middleware :auth
    end
  end

  def resolve(_parent, args, _context) do
    case Auth.register(args) do
      {:error, changeset} -> {:error, changeset.errors}
      x -> x
    end
  end

  def auth(%{value: %User{} = user} = res, _config) do
    Map.update!(res, :context, fn ctx ->
      Map.put(ctx, :user_id, user.id)
    end)
  end
  def auth(res, _config), do: res
end
