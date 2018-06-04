defmodule Queryhub.Osquery do
  @moduledoc """
  The Osquery context.
  """

  import Ecto.Query, warn: false
  alias Queryhub.Repo

  alias Queryhub.Osquery.Query

  @doc """
  Returns the list of queries.

  ## Examples

      iex> list_queries()
      [%Query{}, ...]

  """
  def list_queries do
    Repo.all(Query)
  end

  @doc """
  Gets a single query.

  Raises `Ecto.NoResultsError` if the Query does not exist.

  ## Examples

      iex> get_query!(123)
      %Query{}

      iex> get_query!(456)
      ** (Ecto.NoResultsError)

  """
  def get_query!(id), do: Repo.get!(Query, id)

  @doc """
  Creates a query.

  ## Examples

      iex> create_query(%{field: value})
      {:ok, %Query{}}

      iex> create_query(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_query(attrs \\ %{}) do
    %Query{}
    |> Query.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a query.

  ## Examples

      iex> update_query(query, %{field: new_value})
      {:ok, %Query{}}

      iex> update_query(query, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_query(%Query{} = query, attrs) do
    query
    |> Query.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Query.

  ## Examples

      iex> delete_query(query)
      {:ok, %Query{}}

      iex> delete_query(query)
      {:error, %Ecto.Changeset{}}

  """
  def delete_query(%Query{} = query) do
    Repo.delete(query)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking query changes.

  ## Examples

      iex> change_query(query)
      %Ecto.Changeset{source: %Query{}}

  """
  def change_query(%Query{} = query) do
    Query.changeset(query, %{})
  end

  alias Queryhub.Osquery.Pack

  @doc """
  Returns the list of packs.

  ## Examples

      iex> list_packs()
      [%Pack{}, ...]

  """
  def list_packs do
    Repo.all(Pack)
  end

  @doc """
  Gets a single pack.

  Raises `Ecto.NoResultsError` if the Pack does not exist.

  ## Examples

      iex> get_pack!(123)
      %Pack{}

      iex> get_pack!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pack!(id), do: Repo.get!(Pack, id)

  @doc """
  Creates a pack.

  ## Examples

      iex> create_pack(%{field: value})
      {:ok, %Pack{}}

      iex> create_pack(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pack(attrs \\ %{}) do
    %Pack{}
    |> Pack.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pack.

  ## Examples

      iex> update_pack(pack, %{field: new_value})
      {:ok, %Pack{}}

      iex> update_pack(pack, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pack(%Pack{} = pack, attrs) do
    pack
    |> Pack.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Pack.

  ## Examples

      iex> delete_pack(pack)
      {:ok, %Pack{}}

      iex> delete_pack(pack)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pack(%Pack{} = pack) do
    Repo.delete(pack)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pack changes.

  ## Examples

      iex> change_pack(pack)
      %Ecto.Changeset{source: %Pack{}}

  """
  def change_pack(%Pack{} = pack) do
    Pack.changeset(pack, %{})
  end
end
