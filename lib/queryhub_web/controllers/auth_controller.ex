defmodule QueryHubWeb.AuthController do
  use QueryHubWeb, :controller
  plug Ueberauth
  alias Ueberauth.Strategy.Helpers
  alias QueryHub.User

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Failed to authenticate")
    |> redirect(to: "/")
  end


  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do


  end
end
