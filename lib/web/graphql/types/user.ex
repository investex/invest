defmodule Web.GraphQL.Types.User do
  use Absinthe.Schema.Notation

  @desc "A `User` object."
  object :user do
    field :id, non_null(:id)
    field :email, non_null(:string)
  end

  @desc "A response type with a `User` or a list of `Error`s."
  object :user_payload do
    field :user, :user
    field :errors, non_null(:error) |> list_of |> non_null
  end
end
