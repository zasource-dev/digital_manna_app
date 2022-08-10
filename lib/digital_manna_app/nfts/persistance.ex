defmodule DigitalMannaApp.Nfts.Persistance do
  @moduledoc """
  An NFT Miner Persistance Layer
  """

  alias DigitalMannaApp.Nfts.Manna, as: MannaNFTs
  import DigitalMannaApp.Helpers.URLHelper


  def save_nft(nft) do
    nft
    |> format_nft()
    |> MannaNFTs.add_foundation_nft()
  end

  defp process_nfts(nfts) do
    nfts |> Enum.map(&format_nft/1)
  end

  defp format_nft(_nft = [nft_id: nft_id,  name: name, description: description, image: image, minted_at: minted_at]) do
    %{
      nft_id: nft_id,
      name: name,
      description: description,
      image: get_ipfs_image_url(image),
      minted_at:  minted_at |> String.to_integer() |> transform_minted_at()
    }
  end

  defp placement_image(_image = nil), do: "https://placeholder.pics/svg/300/4EFFA6-4963FF/FF95EA-CBE7FF/This%20is%20an%20NFT"
  defp placement_image(image), do: image

  defp transform_minted_at(_minted_at = nil), do: DateTime.utc_now() |> DateTime.truncate(:second)
  defp transform_minted_at(minted_at) when is_integer(minted_at), do: DateTime.from_unix!(minted_at)

end
