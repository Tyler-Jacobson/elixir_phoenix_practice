defmodule ElixirPhoenixPractice.Repo.Migrations.CreateExamples do
  use Ecto.Migration

  def change do
    create table(:examples) do
      add :name, :string
      add :description, :text
      add :age, :integer
      add :height, :float
      add :working, :boolean, default: false, null: false

      timestamps()
    end
  end
end
