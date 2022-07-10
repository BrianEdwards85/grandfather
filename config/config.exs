import Config

config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase

config :grandfather, Grandfather.Scheduler,
  timezone: "America/Chicago",
  jobs: [
    {"* * * * *", {Grandfather.Ping, :minute, []}},
  ]

config :grandfather, Rabbit,
  host: "192.168.104.11",
  port: 5672,
  virtual_host: "home",
  username: "grandfather_user",
  password: "grandfather_user"

config :grandfather,
  ecto_repos: [Grandfather.Repo]

config :grandfather, Grandfather.Repo,
  username: "grandfather_user",
  password: "grandfather_user",
  database: "grandfather",
  hostname: "192.168.104.11"
