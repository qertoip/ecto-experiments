defmodule User do
  use Ecto.Schema

  schema "users" do
    field :username, :string, null: false
  end
end
