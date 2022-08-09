defmodule DigitalMannaApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      DigitalMannaApp.Repo,
      # Start the Telemetry supervisor
      DigitalMannaAppWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: DigitalMannaApp.PubSub},
      # Start the Endpoint (http/https)
      DigitalMannaAppWeb.Endpoint,
      # Start a worker by calling: DigitalMannaApp.Worker.start_link(arg)
      # {DigitalMannaApp.Worker, arg}
      {DigitalMannaApp.Nfts.Server, :spacex },

    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DigitalMannaApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DigitalMannaAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
