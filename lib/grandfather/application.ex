defmodule Grandfather.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Grandfather.Worker.start_link(arg)
      # {Grandfather.Worker, arg}
      Rabbit,
      Grandfather.Repo
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Grandfather.Supervisor]
    Supervisor.start_link(children, opts)
    Supervisor.start_link([ Grandfather.Scheduler ], [strategy: :one_for_one, name: Grandfather.Supervisor2])
  end
end
