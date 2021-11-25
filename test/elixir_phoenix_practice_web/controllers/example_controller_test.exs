defmodule ElixirPhoenixPracticeWeb.ExampleControllerTest do
  use ElixirPhoenixPracticeWeb.ConnCase

  import ElixirPhoenixPractice.Example_ContextFixtures

  alias ElixirPhoenixPractice.Example_Context.Example

  @create_attrs %{
    age: 42,
    description: "some description",
    height: 120.5,
    name: "some name",
    working: true
  }
  @update_attrs %{
    age: 43,
    description: "some updated description",
    height: 456.7,
    name: "some updated name",
    working: false
  }
  @invalid_attrs %{age: nil, description: nil, height: nil, name: nil, working: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all examples", %{conn: conn} do
      conn = get(conn, Routes.example_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create example" do
    test "renders example when data is valid", %{conn: conn} do
      conn = post(conn, Routes.example_path(conn, :create), example: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.example_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "age" => 42,
               "description" => "some description",
               "height" => 120.5,
               "name" => "some name",
               "working" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.example_path(conn, :create), example: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update example" do
    setup [:create_example]

    test "renders example when data is valid", %{conn: conn, example: %Example{id: id} = example} do
      conn = put(conn, Routes.example_path(conn, :update, example), example: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.example_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "age" => 43,
               "description" => "some updated description",
               "height" => 456.7,
               "name" => "some updated name",
               "working" => false
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, example: example} do
      conn = put(conn, Routes.example_path(conn, :update, example), example: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete example" do
    setup [:create_example]

    test "deletes chosen example", %{conn: conn, example: example} do
      conn = delete(conn, Routes.example_path(conn, :delete, example))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.example_path(conn, :show, example))
      end
    end
  end

  defp create_example(_) do
    example = example_fixture()
    %{example: example}
  end
end
