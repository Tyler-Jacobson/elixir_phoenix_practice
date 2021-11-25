defmodule ElixirPhoenixPracticeWeb.ExampleView do
  use ElixirPhoenixPracticeWeb, :view
  alias ElixirPhoenixPracticeWeb.ExampleView

  def render("index.json", %{examples: examples}) do
    %{data: render_many(examples, ExampleView, "example.json")}
  end

  def render("show.json", %{example: example}) do
    %{data: render_one(example, ExampleView, "example.json")}
  end

  def render("example.json", %{example: example}) do
    %{
      id: example.id,
      name: example.name,
      description: example.description,
      age: example.age,
      height: example.height,
      working: example.working
    }
  end
end
