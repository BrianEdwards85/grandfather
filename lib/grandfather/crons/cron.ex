defmodule Grandfather.Crons.Cron do
  use Ecto.Schema
  import Ecto.Changeset
  alias Crontab.CronExpression.Parser

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "crons" do
    field :name, :string
    field :schedule, :string
    field :topic, :string
    field :message, :string
    field :enabled, :boolean
    timestamps()
  end

  defp validate_schedule(changeset) do
    validate_change(changeset, :schedule, fn :schedule, schedule ->
      case Parser.parse(schedule) do
        {:ok, _} -> []
        {:error, error} -> [schedule: error]
      end
    end)
  end

  @doc false
  def changeset(cron, attrs) do
    cron
    |> cast(attrs, [:name, :schedule, :topic, :message, :enabled])
    |> validate_required([:name, :schedule, :topic, :message])
    |> validate_schedule()
  end

end
