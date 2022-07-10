defmodule Grandfather.Runner do
  alias Grandfather.Crons

  def run(id) do
    %{message: message, topic: topic, enabled: enabled} = Crons.get_cron(id)
    if enabled do
      IO.puts("Running #{id} #{message}")
      Rabbit.publish(topic, message)
    end
  end

end
