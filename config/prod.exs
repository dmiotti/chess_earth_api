use Mix.Config

config :chess_earth, ChessEarthWeb.Endpoint,
  load_from_system_env: true,
  url: [scheme: "https", host: "api.chess.earth", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json",
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE")

config :logger, level: :info

config :chess_earth, ChessEarth.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true
