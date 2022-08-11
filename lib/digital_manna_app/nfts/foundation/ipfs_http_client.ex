defmodule DigitalMannaApp.Nfts.Foundation.IPFSHttpClient do

  @moduledoc """
   A custom module for Http Client request for foundation nfts
  """

  import DigitalMannaApp.Helpers.URLHelper
  require Logger


  @expected_fields ~w(name description image)

  def get(url) do
    match_nft_resource_url(url)
    |> HTTPoison.get
    |> process_response_body()
  end

  def process_response_body({:ok, response}) do
    response.body
    |> Jason.decode!
    |> Map.take(@expected_fields)
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
  def process_response_body({:error, err }) do
    Logger.error("Failed to HTTP fetch resource due to: #{err.reason}")
  end

  def process_request_url(url), do: match_nft_resource_url(url)

end
