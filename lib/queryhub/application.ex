defmodule QueryHub.Application do
  def start(_type, _args) do
    unless Mix.env == :prod do
      Envy.auto_load
    end

    children = [
      Supervisor.Spec.supervisor(QueryHub.Repo, []),
      Supervisor.Spec.supervisor(QueryHubWeb.Endpoint, [])
    ]

    opts = [strategy: :one_for_one, name: QueryHub.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    QueryHubWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
