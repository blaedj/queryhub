defmodule QueryHubWeb.PageController do
  use QueryHubWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
