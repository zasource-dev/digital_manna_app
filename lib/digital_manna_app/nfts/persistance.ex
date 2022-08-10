defmodule DigitalMannaApp.Nfts.Persistance do
  @moduledoc """
  An NFT Miner Persistance Layer
  """

  alias DigitalMannaApp.Nfts.Manna, as: MannaNFTs

  @ipfs_url Application.compile_env(:digital_manna_app, :ipfs_url)

  def save_nft(nft) do
    nft
    |> format_nft()
    |> MannaNFTs.add_foundation_nft()
  end

  defp process_nfts(nfts) do
    nfts |> Enum.map(&format_nft/1)
  end

  defp format_nft(_nft = [description: description, image: image, name: name]) do
    %{
      nft_id: image |> String.replace("ipfs://", ""),
      name: name,
      description: description,
      image: image |> String.replace("ipfs://", "#{@ipfs_url}/"),
      minted_at:  transform_minted_at(nil)
    }
    # "ipfs://QmT4sR85xRYga7ad1K82dWGtYwpUWgNzVrKH78wdZ5Ysw5/nft.png"
  end

  defp placement_image(_image = nil), do: "https://placeholder.pics/svg/300/4EFFA6-4963FF/FF95EA-CBE7FF/This%20is%20an%20NFT"
  defp placement_image(image), do: image

  defp transform_minted_at(_minted_at = nil), do: DateTime.utc_now() |> DateTime.truncate(:second)
  defp transform_minted_at(minted_at) when is_integer(minted_at), do: DateTime.from_unix!(minted_at)

end
