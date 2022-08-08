defmodule DigitalMannaApp.Nfts.Persistance do
  @moduledoc """
  An NFT Miner Persistance Layer
  """

  alias DigitalMannaApp.Nfts.SpaceX.Api, as: SpaceXApi
  alias DigitalMannaApp.Nfts.SpaceXRepo

  def fetch_and_update_nfts(_api = nil), do: fetch_and_update_nfts(:spacex)

  def fetch_and_update_nfts(_api = :spacex) do
    SpaceXApi.fetch_ships!
      |> process_nfts()
      |> SpaceXRepo.inserts_all_nfts()
  end

  defp process_nfts(nfts) do
    nfts
    |> Enum.map(&format_nft/1)
  end

  defp format_nft(%{ "mmsi" => mssi, "type" => type } = nft) do
    %{
      nft_id: nft["id"],
      name: nft["name"],
      description: type,
      image: placement_image(nft["image"]),
      minted_at:  transform_minted_at(mssi)
    }
  end

  defp placement_image(_image = nil), do: "https://placeholder.pics/svg/300/4EFFA6-4963FF/FF95EA-CBE7FF/This%20is%20an%20NFT"
  defp placement_image(image), do: image

  defp transform_minted_at(_minted_at = nil), do: DateTime.utc_now() |> DateTime.truncate(:second)
  defp transform_minted_at(minted_at) when is_integer(minted_at), do: DateTime.from_unix!(minted_at)

end
