defmodule QueryHubWeb.PageControllerTest do
  use QueryHubWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "QueryHub"
  end
end
