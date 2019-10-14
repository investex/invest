defmodule Web.Context do
  @behaviour Plug

  import Plug.Conn
  alias Persistence.{Repo, User}

  def init(opts), do: opts

  def call(conn, _) do
    conn = fetch_session(conn)
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  @doc """
  Return the current user context based on the authorization header
  """
  def build_context(conn) do
    case get_session(conn, :user_id) do
      nil -> %{}
      user_id -> %{current_user: user(user_id)}
    end
  end

  defp user(id) do
    User
    |> Repo.get(id)
  end

end
