defmodule QueryHub.Osquery do
  def list_queries do
    QueryHub.Repo.all(QueryHub.Osquery.Query)
  end

  def get_query!(id) do
    QueryHub.Repo.get!(QueryHub.Osquery.Query, id)
  end

  def create_query(attrs \\ %{}) do
    %QueryHub.Osquery.Query{}
    |> QueryHub.Osquery.Query.changeset(attrs)
    |> QueryHub.Repo.insert()
  end

  def update_query(%QueryHub.Osquery.Query{} = query, attrs) do
    query
    |> QueryHub.Osquery.Query.changeset(attrs)
    |> QueryHub.Repo.update()
  end

  def delete_query(%QueryHub.Osquery.Query{} = query) do
    QueryHub.Repo.delete(query)
  end

  def change_query(%QueryHub.Osquery.Query{} = query) do
    QueryHub.Osquery.Query.changeset(query, %{})
  end

  def list_packs do
    QueryHub.Repo.all(QueryHub.Osquery.Pack)
  end

  def get_pack!(id) do
    QueryHub.Repo.get!(QueryHub.Osquery.Pack, id)
  end

  def create_pack(attrs \\ %{}) do
    %QueryHub.Osquery.Pack{}
    |> QueryHub.Osquery.Pack.changeset(attrs)
    |> QueryHub.Repo.insert()
  end

  def update_pack(%QueryHub.Osquery.Pack{} = pack, attrs) do
    pack
    |> QueryHub.Osquery.Pack.changeset(attrs)
    |> QueryHub.Repo.update()
  end

  def delete_pack(%QueryHub.Osquery.Pack{} = pack) do
    QueryHub.Repo.delete(pack)
  end

  def change_pack(%QueryHub.Osquery.Pack{} = pack) do
    QueryHub.Osquery.Pack.changeset(pack, %{})
  end
end
