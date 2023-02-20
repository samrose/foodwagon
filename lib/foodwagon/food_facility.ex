defmodule Foodwagon.FoodFacility do
  @moduledoc """
  The FoodFacility context.
  """

  import Ecto.Query, warn: false
  alias Foodwagon.Repo

  alias Foodwagon.FoodFacility.MobileFoodFacility

  @doc """
  Returns the list of mobile_food_facilities.

  ## Examples

      iex> list_mobile_food_facilities()
      [%MobileFoodFacility{}, ...]

  """
  def list_mobile_food_facilities do
    Repo.all(MobileFoodFacility)
  end

  @doc """
  Returns the list of mobile_food_facilities
  where the business_name is like the name parameter.

  ## Examples

      iex> find_mobile_food_facilities_by_name_contains(name)
      [%MobileFoodFacility{}, ...]

  """
  def find_mobile_food_facilities_by_name_contains(name) do
    like = "%#{name}%"
    from(u in MobileFoodFacility,
    where: ilike(u.business_name, ^like),
    select: u
    )
    |> Repo.all
  end

  @doc """
  Gets a single mobile_food_facility.

  Raises `Ecto.NoResultsError` if the Mobile food facility does not exist.

  ## Examples

      iex> get_mobile_food_facility!(123)
      %MobileFoodFacility{}

      iex> get_mobile_food_facility!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mobile_food_facility!(id), do: Repo.get!(MobileFoodFacility, id)

  @doc """
  Creates a mobile_food_facility.

  ## Examples

      iex> create_mobile_food_facility(%{field: value})
      {:ok, %MobileFoodFacility{}}

      iex> create_mobile_food_facility(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mobile_food_facility(attrs \\ %{}) do
    %MobileFoodFacility{}
    |> MobileFoodFacility.changeset(attrs)
    |> Repo.insert(on_conflict: :nothing)
  end

  @doc """
  Updates a mobile_food_facility.

  ## Examples

      iex> update_mobile_food_facility(mobile_food_facility, %{field: new_value})
      {:ok, %MobileFoodFacility{}}

      iex> update_mobile_food_facility(mobile_food_facility, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mobile_food_facility(%MobileFoodFacility{} = mobile_food_facility, attrs) do
    mobile_food_facility
    |> MobileFoodFacility.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a mobile_food_facility.

  ## Examples

      iex> delete_mobile_food_facility(mobile_food_facility)
      {:ok, %MobileFoodFacility{}}

      iex> delete_mobile_food_facility(mobile_food_facility)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mobile_food_facility(%MobileFoodFacility{} = mobile_food_facility) do
    Repo.delete(mobile_food_facility)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mobile_food_facility changes.

  ## Examples

      iex> change_mobile_food_facility(mobile_food_facility)
      %Ecto.Changeset{data: %MobileFoodFacility{}}

  """
  def change_mobile_food_facility(%MobileFoodFacility{} = mobile_food_facility, attrs \\ %{}) do
    MobileFoodFacility.changeset(mobile_food_facility, attrs)
  end
end
