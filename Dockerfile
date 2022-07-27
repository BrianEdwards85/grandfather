FROM elixir

RUN mkdir /app
WORKDIR /app

RUN mix do local.hex --force, local.rebar --force

COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get
RUN mix deps.compile

COPY priv priv
COPY lib lib
RUN mix compile

RUN mix release

CMD ["bash", "/app/_build/dev/rel/grandfather/bin/grandfather", "start"]