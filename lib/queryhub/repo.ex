defmodule QueryHub.Repo do
  use Ecto.Repo, otp_app: :queryhub

  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end
end
