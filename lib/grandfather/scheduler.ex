defmodule Grandfather.Scheduler do
  use Quantum, otp_app: :grandfather
  alias Grandfather.Crons
  alias Grandfather.Crons.Cron
  alias Grandfather.Runner
  alias Crontab.CronExpression.Parser
  alias Quantum.Job

  def init(config) do
    Keyword.get_and_update(config, :jobs, fn jobs ->
      {jobs, jobs ++ (Crons.list_crons() |> Enum.flat_map(&create_job/1))}
    end)
    |> elem(1)
  end

  defp create_job(%Cron{id: id, schedule: schedule, enabled: enabled}) do
    case Parser.parse(schedule) do
      {:ok, cron_expression} ->
        __MODULE__.new_job()
        |> Job.set_name(String.to_atom(id))
        |> Job.set_schedule(cron_expression)
        |> Job.set_state(if enabled, do: :active, else: :inactive)
        |> Job.set_task({Runner, :run, [id]})
        |> List.wrap()
      {:error, _error} -> []
    end
  end
end
