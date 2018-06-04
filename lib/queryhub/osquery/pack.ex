defmodule Queryhub.Osquery.Pack do
  use Ecto.Schema
  import Ecto.Changeset

  schema "packs" do
    field(:description, :string)
    field(:name, :string)

    timestamps()
  end

  @doc false
  def changeset(pack, attrs) do
    pack
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
