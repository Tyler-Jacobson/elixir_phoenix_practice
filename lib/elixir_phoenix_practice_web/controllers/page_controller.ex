defmodule ElixirPhoenixPracticeWeb.PageController do
  use ElixirPhoenixPracticeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
