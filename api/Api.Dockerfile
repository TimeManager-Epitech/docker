# Use an official Elixir runtime as a parent image.
FROM elixir:alpine

ARG MIX_ENV
ENV MIX_ENV=${MIX_ENV}

WORKDIR /app
COPY . /app

RUN apk update && \
  apk add inotify-tools

RUN mix local.hex --force
RUN mix deps.get
RUN mix compile

CMD mix phx.server