defmodule QueryHubWeb.PageController do
  use QueryHubWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def discover(conn, _params) do
    render(conn, "discover.html")
  end
end
