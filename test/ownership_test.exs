defmodule OwnershipTest do
  #use ExUnit.CaseTemplate
  use ExUnit.Case

  alias EctoExperiments.Repo
  alias EctoExperiments.User

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(EctoExperiments.Repo, sandbox: true)
  end

  test "insert" do
    Repo.insert!( %User{ username: "qertoip" } )
  end
end
