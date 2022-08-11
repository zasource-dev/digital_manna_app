defmodule DigitalMannaApp.Nfts.Foundation.IPFSHttpClient do

  @moduledoc """
   A custom module for Http Client request for foundation nfts
  """

  use HTTPoison.Base

  import DigitalMannaApp.Helpers.URLHelper


  @expected_fields ~w(name description image)


  def process_request_url(url), do: match_nft_resource_url(url)

  def process_response_body(body) do
    body
    |> Jason.decode!
    |> Map.take(@expected_fields)
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end
