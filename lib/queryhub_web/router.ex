defmodule QueryHubWeb.Router do
  use QueryHubWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", QueryHubWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/discover", PageController, :discover)

    resources("/queries", QueryController)
    resources("/packs", PackController)
  end

  scope "/auth", QueryHubWeb do
    pipe_through(:browser)
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", QueryHubWeb do
  #   pipe_through :api
  # end
end
