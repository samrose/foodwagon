# Elixir + Phoenix

FROM elixir:1.14.3

# Install debian packages
RUN apt-get update
RUN apt-get install --yes build-essential inotify-tools postgresql-client

# Install Phoenix packages
RUN echo "TEST"
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive install hex phx_new
RUN mix archive 

WORKDIR /app
EXPOSE 4000
