defmodule Web.GraphQL.Middleware.ErrorHandling do
  @behaviour Absinthe.Middleware

  def call(res, _opts) do
    %{res | errors: Enum.flat_map(res.errors, &handle_error/1)}
  end

  defp handle_error(%Ecto.Changeset{} = changeset) do
    [%{
      message: "There was a problem with the request",
      state: changeset |> Ecto.Changeset.traverse_errors(fn {err, _opts} -> err end)
    }]
  end
  defp handle_error(%Ecto.NoResultsError{}) do
    ["Record not found"]
  end
  defp handle_error(error), do: [error]
end
