defmodule SharedOwnershipTest do
  use ExUnit.Case

  alias EctoExperiments.Repo
  alias EctoExperiments.User

  setup do
    # The :shared mode allows a process to share its connection with any other process automatically
    Ecto.Adapters.SQL.Sandbox.mode(EctoExperiments.Repo, { :shared, self() })

    # Explicitly get a connection before each test
    # By default (sandbox: true) the test is wrapped in a transaction
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(EctoExperiments.Repo)
  end

  test "the test is wrapped in a transaction" do
    assert Repo.in_transaction?
  end

  test "async process shares transaction with the parent one" do
    Repo.insert!( %User{ username: "john" } )
    test_user_count = Repo.aggregate(User, :count, :id)
    IO.puts("In the TEST process the User.count=#{test_user_count}")

    t = Task.async(fn ->
      async_user_count = Repo.aggregate(User, :count, :id)
      IO.puts("In the ASYNC process the User.count=#{async_user_count}")
      assert async_user_count == 1
    end)

    Task.await(t)
  end
end
