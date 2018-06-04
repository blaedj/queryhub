defmodule QueryHub.OsqueryTest do
  use QueryHub.DataCase

  describe "queries" do
    @valid_attrs %{
      description: "some description",
      launcher_version: "some launcher_version",
      name: "some name",
      osquery_version: "some osquery_version",
      query: "some query"
    }
    @update_attrs %{
      description: "some updated description",
      launcher_version: "some updated launcher_version",
      name: "some updated name",
      osquery_version: "some updated osquery_version",
      query: "some updated query"
    }
    @invalid_attrs %{
      description: nil,
      launcher_version: nil,
      name: nil,
      osquery_version: nil,
      query: nil
    }

    def query_fixture(attrs \\ %{}) do
      {:ok, query} =
        attrs
        |> Enum.into(@valid_attrs)
        |> QueryHub.Osquery.create_query()

      query
    end

    test "list_queries/0 returns all queries" do
      query = query_fixture()
      assert QueryHub.Osquery.list_queries() == [query]
    end

    test "get_query!/1 returns the query with given id" do
      query = query_fixture()
      assert QueryHub.Osquery.get_query!(query.id) == query
    end

    test "create_query/1 with valid data creates a query" do
      assert {:ok, %QueryHub.Osquery.Query{} = query} =
               QueryHub.Osquery.create_query(@valid_attrs)

      assert query.description == "some description"
      assert query.launcher_version == "some launcher_version"
      assert query.name == "some name"
      assert query.osquery_version == "some osquery_version"
      assert query.query == "some query"
    end

    test "create_query/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = QueryHub.Osquery.create_query(@invalid_attrs)
    end

    test "update_query/2 with valid data updates the query" do
      query = query_fixture()
      assert {:ok, query} = QueryHub.Osquery.update_query(query, @update_attrs)
      assert %QueryHub.Osquery.Query{} = query
      assert query.description == "some updated description"
      assert query.launcher_version == "some updated launcher_version"
      assert query.name == "some updated name"
      assert query.osquery_version == "some updated osquery_version"
      assert query.query == "some updated query"
    end

    test "update_query/2 with invalid data returns error changeset" do
      query = query_fixture()
      assert {:error, %Ecto.Changeset{}} = QueryHub.Osquery.update_query(query, @invalid_attrs)
      assert query == QueryHub.Osquery.get_query!(query.id)
    end

    test "delete_query/1 deletes the query" do
      query = query_fixture()
      assert {:ok, %QueryHub.Osquery.Query{}} = QueryHub.Osquery.delete_query(query)
      assert_raise Ecto.NoResultsError, fn -> QueryHub.Osquery.get_query!(query.id) end
    end

    test "change_query/1 returns a query changeset" do
      query = query_fixture()
      assert %Ecto.Changeset{} = QueryHub.Osquery.change_query(query)
    end
  end

  describe "packs" do
    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def pack_fixture(attrs \\ %{}) do
      {:ok, pack} =
        attrs
        |> Enum.into(@valid_attrs)
        |> QueryHub.Osquery.create_pack()

      pack
    end

    test "list_packs/0 returns all packs" do
      pack = pack_fixture()
      assert QueryHub.Osquery.list_packs() == [pack]
    end

    test "get_pack!/1 returns the pack with given id" do
      pack = pack_fixture()
      assert QueryHub.Osquery.get_pack!(pack.id) == pack
    end

    test "create_pack/1 with valid data creates a pack" do
      assert {:ok, %QueryHub.Osquery.Pack{} = pack} = QueryHub.Osquery.create_pack(@valid_attrs)
      assert pack.description == "some description"
      assert pack.name == "some name"
    end

    test "create_pack/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = QueryHub.Osquery.create_pack(@invalid_attrs)
    end

    test "update_pack/2 with valid data updates the pack" do
      pack = pack_fixture()
      assert {:ok, pack} = QueryHub.Osquery.update_pack(pack, @update_attrs)
      assert %QueryHub.Osquery.Pack{} = pack
      assert pack.description == "some updated description"
      assert pack.name == "some updated name"
    end

    test "update_pack/2 with invalid data returns error changeset" do
      pack = pack_fixture()
      assert {:error, %Ecto.Changeset{}} = QueryHub.Osquery.update_pack(pack, @invalid_attrs)
      assert pack == QueryHub.Osquery.get_pack!(pack.id)
    end

    test "delete_pack/1 deletes the pack" do
      pack = pack_fixture()
      assert {:ok, %QueryHub.Osquery.Pack{}} = QueryHub.Osquery.delete_pack(pack)
      assert_raise Ecto.NoResultsError, fn -> QueryHub.Osquery.get_pack!(pack.id) end
    end

    test "change_pack/1 returns a pack changeset" do
      pack = pack_fixture()
      assert %Ecto.Changeset{} = QueryHub.Osquery.change_pack(pack)
    end
  end
end
