# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Foodwagon.Repo.insert!(%Foodwagon.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Foodwagon.CSVUtil.csv_row_to_table_record("priv/repo/data/Mobile_Food_Facility_Permit.csv")
