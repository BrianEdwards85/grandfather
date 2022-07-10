defmodule Grandfather.Repo.Migrations.Cron do
  use Ecto.Migration
  def change do
    create table(:crons, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("uuid_generate_v4()")
      add :name, :text, null: false
      add :schedule, :text, null: false
      add :topic, :text, null: false
      add :message, :text, null: false
      add :enabled, :boolean, null: false, default: true
      timestamps()
    end
  end
end
