use Mix.Config

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n"

config :ecto_experiments, EctoExperiments.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: "localhost",
  database: "ecto_experiments_test",
  username: "postgres",
  password: "test123",
  pool: Ecto.Adapters.SQL.Sandbox
