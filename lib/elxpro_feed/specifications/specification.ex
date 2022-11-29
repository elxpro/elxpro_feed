defmodule ElxproFeed.Specifications.Specification do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "specifications" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(specification, attrs) do
    specification
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
