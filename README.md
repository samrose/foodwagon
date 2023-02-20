# Foodwagon


### Running the production release in docker compose
```
docker compose build --no-cache
docker compose run web /app/bin/migrate
docker compose run web /app/bin/foodwagon start_iex
```

at the iex prompt, insert the following function, and press `<enter>`

```
iex(foodwagon@nodename)1> Foodwagon.CSVUtil.csv_row_to_table_record("priv/repo/data/Mobile_Food_Facility_Permit.csv")
#an example of successfull results shown below:
[
  ok: %Foodwagon.FoodFacility.MobileFoodFacility{
    __meta__: #Ecto.Schema.Metadata<:loaded, "mobile_food_facilities">,
    id: 1,
    address: "5 THE EMBARCADERO",
    block: "0234",
    blocklot: "0234017",
    business_name: "Ziaurehman Amini",
    cnn: "30727000",
    dayshours: nil,
    facity_type: nil,
    food_items: nil,
    latitude: "37.794331003246846",
    location: "(37.794331003246846, -122.39581105302317)",
    location_description: "MARKET ST: DRUMM ST intersection",
    locationid: "735318",
    longitude: "-122.39581105302317",
    lot: "017",
    permit: "15MFF-0159",
    status: "REQUESTED",
    inserted_at: ~N[2023-02-20 19:45:40],
    updated_at: ~N[2023-02-20 19:45:40]
  },
[...]
```

(the insertion of these records is contrained by the `locationid` field, which is unique to each entry )

...now simply run

`docker compose up`
## mix release process
The `Dockerfile` contained in this project automates the steps to generate a `mix release` of this project.


Some key steps include

1. Setting the `MIX_ENV="prod"` env var
2. running `mix deps.get --only $MIX_ENV` to obtain only the deps needed for production running of the app.
3. Running `mix compile` to compile the release
4. Running `mix release`
5. Stripping away the previous build stages so that the final image will only contain the compiled release and other runtime necessities with `FROM ${RUNNER_IMAGE}` in the `Dockerfile`


# Example queries

- http://localhost:4000/api/mobile_food_facilities?name_contains=pizza
- http://localhost:4000/api/mobile_food_facilities?name_contains=taco
- http://localhost:4000/api/mobile_food_facilities?name_contains=grill
- http://localhost:4000/api/mobile_food_facilities?name_contains=coffee
- http://localhost:4000/api/mobile_food_facilities?name_contains=juice
- http://localhost:4000/api/mobile_food_facilities?name_contains=gyro
- http://localhost:4000/api/mobile_food_facilities?name_contains=cheesesteak






















## REmove 

query `select * from mobile_food_facilities where LOWER(business_name) LIKE LOWER('%Hot dog%');`


`Foodwagon.Repo.aggregate(Foodwagon.FoodFacility.MobileFoodFacility, :count, :id)`

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
