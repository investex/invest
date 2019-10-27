defmodule Invest.Web.GraphQL.Types.Error do
  use Absinthe.Schema.Notation

  object :error do
    field :name, non_null(:string)
    field :message, non_null(:string)
  end
end
