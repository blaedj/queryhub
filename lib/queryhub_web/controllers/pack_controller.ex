defmodule QueryhubWeb.PackController do
  use QueryhubWeb, :controller

  alias Queryhub.Osquery
  alias Queryhub.Osquery.Pack

  def index(conn, _params) do
    packs = Osquery.list_packs()
    render(conn, "index.html", packs: packs)
  end

  def new(conn, _params) do
    changeset = Osquery.change_pack(%Pack{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pack" => pack_params}) do
    case Osquery.create_pack(pack_params) do
      {:ok, pack} ->
        conn
        |> put_flash(:info, "Pack created successfully.")
        |> redirect(to: pack_path(conn, :show, pack))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pack = Osquery.get_pack!(id)
    render(conn, "show.html", pack: pack)
  end

  def edit(conn, %{"id" => id}) do
    pack = Osquery.get_pack!(id)
    changeset = Osquery.change_pack(pack)
    render(conn, "edit.html", pack: pack, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pack" => pack_params}) do
    pack = Osquery.get_pack!(id)

    case Osquery.update_pack(pack, pack_params) do
      {:ok, pack} ->
        conn
        |> put_flash(:info, "Pack updated successfully.")
        |> redirect(to: pack_path(conn, :show, pack))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pack: pack, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pack = Osquery.get_pack!(id)
    {:ok, _pack} = Osquery.delete_pack(pack)

    conn
    |> put_flash(:info, "Pack deleted successfully.")
    |> redirect(to: pack_path(conn, :index))
  end
end
