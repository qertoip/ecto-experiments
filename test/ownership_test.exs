defmodule OwnershipTest do
  #use ExUnit.CaseTemplate
  use ExUnit.Case

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(EctoExperiments.Repo, sandbox: true)
  end

  test "the truth" do
    assert 1 + 1 == 2
  end
end
