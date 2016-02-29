ExUnit.start

Mix.Task.run "ecto.create", ~w(-r EctoExperiments.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r EctoExperiments.Repo --quiet)
