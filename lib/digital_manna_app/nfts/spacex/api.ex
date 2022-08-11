defmodule DigitalMannaApp.Nfts.SpaceX.Api do
  @moduledoc """
  A module that consumes the SpaceX GraphQL Api
  """

  alias DigitalMannaApp.Nfts.SpaceX.Query

  @doc """
  Establishes a connection to the SpaceX GraphQL API
  """
  @spec connect :: :ok
  def connect(), do: Neuron.Config.set(url: graphql_url())

  @doc """
   Returns a response with list of ships for spaceX rocket launches
  """
  @spec fetch_ships :: {:ok, Neuron.Response.t}
  def fetch_ships(), do: query(Query.get_ships_query())

  @spec fetch_ships! :: List.t
  def fetch_ships!() do
    {:ok, %Neuron.Response{body: %{"data" => data}}} = fetch_ships()
    Map.get(data, "ships")
  end

  defp query(gql_query) do
    with :ok <- connect() do
      Neuron.query(gql_query)
    end
  end

  defp graphql_url(), do: Application.fetch_env!(:digital_manna_app, :spacex)[:url]
end
