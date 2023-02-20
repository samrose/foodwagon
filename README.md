# Foodwagon



## Starting in development mode

### Nix

### Docker

## mix release process


### Load the data
`_build/prod/rel/foodwagon/bin/foodwagon eval "Foodwagon.Release.migrate"`




# Example queries

http://localhost:4000/api/mobile_food_facilities?name_contains=pizza
http://localhost:4000/api/mobile_food_facilities?name_contains=tacos
http://localhost:4000/api/mobile_food_facilities?name_contains=grill
http://localhost:4000/api/mobile_food_facilities?name_contains=coffee
http://localhost:4000/api/mobile_food_facilities?name_contains=juice
http://localhost:4000/api/mobile_food_facilities?name_contains=gyro
http://localhost:4000/api/mobile_food_facilities?name_contains=cheesesteak






















## REmove 

query `select * from mobile_food_facilities where LOWER(business_name) LIKE LOWER('%Hot dog%');`


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
