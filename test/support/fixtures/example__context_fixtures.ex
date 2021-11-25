defmodule ElixirPhoenixPractice.Example_ContextFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirPhoenixPractice.Example_Context` context.
  """

  @doc """
  Generate a example.
  """
  def example_fixture(attrs \\ %{}) do
    {:ok, example} =
      attrs
      |> Enum.into(%{
        age: 42,
        description: "some description",
        height: 120.5,
        name: "some name",
        working: true
      })
      |> ElixirPhoenixPractice.Example_Context.create_example()

    example
  end
end
