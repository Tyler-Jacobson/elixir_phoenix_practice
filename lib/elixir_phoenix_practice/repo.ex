defmodule ElixirPhoenixPractice.Repo do
  use Ecto.Repo,
    otp_app: :elixir_phoenix_practice,
    adapter: Ecto.Adapters.Postgres
end
