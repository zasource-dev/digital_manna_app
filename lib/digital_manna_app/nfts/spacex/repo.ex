defmodule DigitalMannaApp.Nfts.SpaceXRepo do
  @moduledoc """
  A custom module repo for SpaceX NFTs
  """


  alias DigitalMannaApp.Repo
  alias DigitalMannaApp.Nfts.Schema.SpaceXNFT


  def list_latest_nfts() do
    SpaceXNFT.select_spacex_nfts()
    |> SpaceXNFT.ordered_by_minted_at()
    |> Repo.all()
  end

end
