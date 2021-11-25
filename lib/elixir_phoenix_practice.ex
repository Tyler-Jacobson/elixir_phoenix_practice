defmodule ElixirPhoenixPractice do
  alias ElixirPhoenixPractice.Example_Context.Example

  # def create_example(attrs) do
  #   case Example.changeset(%Example{}, attrs) do
  #     %{valid?: true} = changeset ->
  #       example =
  #         changeset
  #         |> Ecto.Changeset.apply_changes()
  #         |> Map.put{:id, Ecto.UUID.generate()}
  #       {:ok, example}
  #     changeset ->
  #       {:error, changeset}
  #   end
  # end


  @moduledoc """
  ElixirPhoenixPractice keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
end
