# Foodwagon
Welcome to Foodwagon!

This application is designed to be a read-only HTTP REST API of government inspection and licensing data Mobile Food Facilities in the San Francisco area.

A short data discovery process reveals that many of the entries do not have descriptions of available food items. 

However, many of the mobile food businesses do have the name of the type of food they prepare in their business name.

Therefore, this implementation allows a user to filter using a `?name_contains=<name>` parameter, and will return case-insensitive responses where a name is "like" the name you provide. See "Example queries" section below once you get the app up and running.

## Running the production release in docker compose

This application uses docker as a distribution method. The `Dockerfile` contained in this project allows the application to be deployed as a phoenix/elixir `mix release` project.


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

Note: the insertion of these records is constrained by the `locationid` field, which is unique to each entry. The application will not duplicate a record insertion if it contains the same locationid. This constraint was chosen so that the application can be run with demonstration data. A different constraining schema might be chosen if the data were to be updated on a schedule. 

...now simply run

`docker compose up`


## Example queries
Once the applicaiton is up and running via `docker compose up` the following queries demonstrate the functionality
- http://localhost:4000/api/mobile_food_facilities?name_contains=pizza
- http://localhost:4000/api/mobile_food_facilities?name_contains=taco
- http://localhost:4000/api/mobile_food_facilities?name_contains=grill
- http://localhost:4000/api/mobile_food_facilities?name_contains=coffee
- http://localhost:4000/api/mobile_food_facilities?name_contains=juice
- http://localhost:4000/api/mobile_food_facilities?name_contains=gyro
- http://localhost:4000/api/mobile_food_facilities?name_contains=cheesesteak

## Deploying the application to production servers 
Docker compose is used so that someone may still run this project on their local computer, albeit in production mode. But the application `Dockerfile` itself is intended to be usable as a production release method. 

However, if this `Dockerfile` were used in to deploy the application in production, the environment it is deployed to would have the following requirements:

1. A running and securely configured  postgresql 14 or higher database server. 
2. A properly configured html reverse proxy server, such as NGINX, with valid Secure Socket Layer HTTPS certificate configured for all connections.
3. The following environmental variables must be set to the correct value: 
  - `DATABASE_URL` (example `postgresql://USER:PASS@HOST/database`)
  - `PHX_HOST` (to fully qualified domain name of the host where the running application is found)  
  - `SECRET_KEY_BASE` (can be produced by running `mix phx.gen.secret` prior to deployment)
  - Optional: `PORT` (a default is set to `4000` in `config/runtime.exs`)
  - Optional: `POOL_SIZE` (a postgres variable, with a default set to `10`)


### Understanding the mix release process
The `Dockerfile` contained in this project automates the steps to generate a `mix release` of this project.


Some key steps include

1. Setting the `MIX_ENV="prod"` env var
2. running `mix deps.get --only $MIX_ENV` to obtain only the deps needed for production running of the app.
3. Running `mix compile` to compile the release
4. Running `mix release`
5. Stripping away the previous build stages so that the final image will only contain the compiled release and other runtime necessities with `FROM ${RUNNER_IMAGE}` in the `Dockerfile`





# Things that could have been included with more development time

1. A background data updating/reconciliation using the `Oban` elixir project. This could access new copies of data, and update the records in the database as a "background" process. More information available at https://github.com/sorentwo/oban
2. This application contains basic testing of the endpoints. With more time I would have produced tests to cover the parameter filtering based on the `name_contains` parameter submitted by the request.
3. I would explore using the Google Business Profile API to obtain recent menus and potentially a more detailed data set on the types of foods that mobile food facilities prepare. Accessing this data could also happen in a background `Oban` process, comparing businesses with data available in the Google business profile API. see: https://developers.google.com/my-business/reference/rest/v4/FoodMenus
