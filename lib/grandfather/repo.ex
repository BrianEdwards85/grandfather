defmodule Grandfather.Repo do
  use Ecto.Repo,
    otp_app: :grandfather,
    adapter: Ecto.Adapters.Postgres
end
