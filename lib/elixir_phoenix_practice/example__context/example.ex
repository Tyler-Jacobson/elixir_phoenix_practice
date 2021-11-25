defmodule ElixirPhoenixPractice.Example_Context.Example do
  use Ecto.Schema
  import Ecto.Changeset

  schema "examples" do
    field :age, :integer
    field :description, :string
    field :height, :float
    field :name, :string
    field :working, :boolean, default: false

    timestamps()
  end

  # embedded_schema do
  #   field :age, :integer
  #   field :description, :string
  #   field :height, :float
  #   field :name, :string
  #   field :working, :boolean, default: false

  #   timestamps()
  # end

  @doc false
  def changeset(example, attrs) do
    example
    |> cast(attrs, [:name, :description, :age, :height, :working])
    |> validate_required([:name, :description, :age, :height, :working])
  end
end
