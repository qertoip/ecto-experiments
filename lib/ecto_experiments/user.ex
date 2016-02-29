defmodule EctoExperiments.User do
  use Ecto.Schema

  schema "users" do
    field :username, :string, null: false

    timestamps
  end
end
