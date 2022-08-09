defmodule DigitalMannaApp.Helpers.MapHelper do
  @moduledoc """
   A MapHelper module that provides extra functions for working with `Map`.
  """

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

 defp transform_minted_at(minted_at) do
  minted_at
  |> String.to_integer()
  |> DateTime.from_unix!()
end




end
