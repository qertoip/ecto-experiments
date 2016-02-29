use Mix.Config

# Print only warnings and errors during test
config :logger, level: :all

config :ecto_experiments, EctoExperiments.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: "localhost",
  database: "ecto_experiments_test",
  username: "postgres",
  password: "test123",
  pool: Ecto.Adapters.SQL.Sandbox
