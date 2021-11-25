defmodule ElixirPhoenixPracticeWeb.ExampleController do
  use ElixirPhoenixPracticeWeb, :controller

  alias ElixirPhoenixPractice.Example_Context
  alias ElixirPhoenixPractice.Example_Context.Example

  action_fallback ElixirPhoenixPracticeWeb.FallbackController

  def index(conn, _params) do
    examples = Example_Context.list_examples()
    render(conn, "index.json", examples: examples)

  end

  def create(conn, %{"example" => example_params}) do
    with {:ok, %Example{} = example} <- Example_Context.create_example(example_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.example_path(conn, :show, example))
      |> render("show.json", example: example)
    end
  end

  def show(conn, %{"id" => id}) do
    example = Example_Context.get_example!(id)
    render(conn, "show.json", example: example)
  end

  def update(conn, %{"id" => id, "example" => example_params}) do
    example = Example_Context.get_example!(id)

    with {:ok, %Example{} = example} <- Example_Context.update_example(example, example_params) do
      render(conn, "show.json", example: example)
    end
  end

  def delete(conn, %{"id" => id}) do
    example = Example_Context.get_example!(id)

    with {:ok, %Example{}} <- Example_Context.delete_example(example) do
      send_resp(conn, :no_content, "")
    end
  end
end
