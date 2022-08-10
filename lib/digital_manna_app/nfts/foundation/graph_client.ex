defmodule DigitalMannaApp.Nfts.Foundation.GraphClientBehaviour do
  @moduledoc false

  @callback connect(String.t) :: :ok
  @callback fetch_nfts(integer()) :: List.t
end

defmodule DigitalMannaApp.Nfts.Foundation.GraphClient do
  @moduledoc """
   a Foundation Graph Client module for interacting with the Foundation API Service
  """
  @behaviour DigitalMannaApp.Nfts.Foundation.GraphClientBehaviour

  @api_key Application.compile_env(:digital_manna_app, :foundation)[:secret]
  @endpoint_url Application.compile_env(:digital_manna_app, :foundation)[:url]

  alias DigitalMannaApp.Nfts.Foundation.Query
  require Logger


  @doc """
    Establishes a connection to the Foundation GraphQL API
  """
  def connect(url), do: Neuron.Config.set(url: url)
  def connect(), do: connect(graphql_url())


  @doc """
   Returns a response with list of ships for spaceX rocket launches
  """
  @spec fetch_nfts(integer()) :: List.t
  def fetch_nfts(first \\ 10) when is_number(first) do
    with :ok <- connect(),
        {:ok, %Neuron.Response{ body: %{ "data" => %{ "nfts" => nfts } }}} <- Neuron.query(Query.get_recent_nfts(), %{ first: first})
    do
      {:ok, nfts}
    else
      {:error, %HTTPoison.Error{id: nil, reason: reason}} ->
        Logger.error("Failed to fetch NFTs due to #{reason}...")
        {:error, "Failed to fetch NFTs due to #{reason}..."}
    end
  end


  def process_response() do

  end

  defp graphql_url() do
    @endpoint_url
    |> String.replace("[api-key]", @api_key)
  end
end
