defmodule ElixirPhoenixPractice.Example_ContextTest do
  use ElixirPhoenixPractice.DataCase

  alias ElixirPhoenixPractice.Example_Context

  describe "examples" do
    alias ElixirPhoenixPractice.Example_Context.Example

    import ElixirPhoenixPractice.Example_ContextFixtures

    @invalid_attrs %{age: nil, description: nil, height: nil, name: nil, working: nil}

    test "list_examples/0 returns all examples" do
      example = example_fixture()
      assert Example_Context.list_examples() == [example]
    end

    test "get_example!/1 returns the example with given id" do
      example = example_fixture()
      assert Example_Context.get_example!(example.id) == example
    end

    test "create_example/1 with valid data creates a example" do
      valid_attrs = %{age: 42, description: "some description", height: 120.5, name: "some name", working: true}

      assert {:ok, %Example{} = example} = Example_Context.create_example(valid_attrs)
      assert example.age == 42
      assert example.description == "some description"
      assert example.height == 120.5
      assert example.name == "some name"
      assert example.working == true
    end

    test "create_example/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Example_Context.create_example(@invalid_attrs)
    end

    test "update_example/2 with valid data updates the example" do
      example = example_fixture()
      update_attrs = %{age: 43, description: "some updated description", height: 456.7, name: "some updated name", working: false}

      assert {:ok, %Example{} = example} = Example_Context.update_example(example, update_attrs)
      assert example.age == 43
      assert example.description == "some updated description"
      assert example.height == 456.7
      assert example.name == "some updated name"
      assert example.working == false
    end

    test "update_example/2 with invalid data returns error changeset" do
      example = example_fixture()
      assert {:error, %Ecto.Changeset{}} = Example_Context.update_example(example, @invalid_attrs)
      assert example == Example_Context.get_example!(example.id)
    end

    test "delete_example/1 deletes the example" do
      example = example_fixture()
      assert {:ok, %Example{}} = Example_Context.delete_example(example)
      assert_raise Ecto.NoResultsError, fn -> Example_Context.get_example!(example.id) end
    end

    test "change_example/1 returns a example changeset" do
      example = example_fixture()
      assert %Ecto.Changeset{} = Example_Context.change_example(example)
    end
  end
end
