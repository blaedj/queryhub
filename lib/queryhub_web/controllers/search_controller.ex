defmodule QueryHubWeb.SearchController do
  use QueryHubWeb, :controller

  def discover(conn, _params) do
    render(conn, "discover.html")
  end
end
