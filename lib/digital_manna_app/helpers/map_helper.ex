defmodule DigitalMannaApp.Helpers.MapHelper do
  @moduledoc """
   A MapHelper module that provides extra functions for working with `Map`.
  """

import DigitalMannaApp.Helpers.URLHelper

def map_nft_to_required_fields(_raw_nft = %{
  "dateMinted" => dateMinted,
  "tokenIPFSPath" => tokenIPFSPath,
  "id" => id,
  "nftContract" => %{ "name" => name }
}) do

  %{
    nft_id: id,
    name: name,
    description: "",
    image: tokenIPFSPath,
    minted_at:  transform_minted_at(dateMinted)
  }
 end

 def map_tuple_list_to_kw_list(tuple_list) do
  tuple_list
  |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
 end

 def only_ipfs_tokens(nfts) do
  ipfs_nft_tokens = nfts
  |> Enum.filter(fn nft -> Map.get(nft, "tokenIPFSPath") |> is_ipfs_url?() end)

  {:ok, ipfs_nft_tokens}
 end

 def only_ipfs_tokens!(nfts) do
  {:ok, ipfs_nft_tokens} = only_ipfs_tokens(nfts)
  ipfs_nft_tokens
 end


 defp transform_minted_at(minted_at) do
  minted_at
  |> String.to_integer()
  |> DateTime.from_unix!()
 end

end
