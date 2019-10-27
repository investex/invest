defmodule Invest.Web.Endpoint do
  use Phoenix.Endpoint, otp_app: :invest_web

  # socket "/socket", Invest.Web.UserSocket,
  #   websocket: true,
  #   longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  # plug Plug.Static,
  #   at: "/",
  #   from: :invest_web,
  #   gzip: false,
  #   only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger, log: :debug
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :redis,
    key: "id",
    encryption_salt: "dRMsL41fXXmLqEn1Mkb3oFmDJzPjXjDBKs8Pid38rzMZ3U9kSnKRL5kJBEJT55iK",
    signing_salt: "P68y46rZwitXFk2arJiKTqn2UL7fP3traEeTdDZaX8Uz58x2Q9WKmf3eTtg7AKBK",
    key_length: 64,
    log: :debug

  plug Invest.Web.Context

  plug Absinthe.Plug,
    schema: Invest.Web.GraphQL.Schema,
    before_send: {__MODULE__, :absinthe_before_send}

  def absinthe_before_send(conn, %Absinthe.Blueprint{} = blueprint) do
    cond do
      blueprint.execution.context[:_logout] ->
        configure_session(conn, [drop: true])
      user_id = blueprint.execution.context[:user_id] ->
        put_session(conn, :user_id, user_id)
      true -> conn
    end
  end
  def absinthe_before_send(conn, _) do
    conn
  end
end
