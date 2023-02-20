# Foodwagon



## Starting in development mode

### Docker
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


docker compose up
## mix release process


### Load the data
`_build/prod/rel/foodwagon/bin/foodwagon eval "Foodwagon.Release.load_data"`




# Example queries

http://localhost:4000/api/mobile_food_facilities?name_contains=pizza
http://localhost:4000/api/mobile_food_facilities?name_contains=taco
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
