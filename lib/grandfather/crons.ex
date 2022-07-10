defmodule Grandfather.Crons do

  import Ecto.Query, warn: false
  alias Grandfather.Repo

  alias Grandfather.Crons.Cron

  def list_crons(), do: Repo.all(Cron)
  def get_cron(id), do: Repo.get(Cron, id)

  def add_cron(attrs \\ %{}) do
    %Cron{}
    |> Cron.changeset(attrs)
    |> Repo.insert()
  end

  def update_cron(id, attrs \\ %{}) do
    get_cron(id)
    |> Cron.changeset(attrs)
    |> Repo.update()
  end
end
