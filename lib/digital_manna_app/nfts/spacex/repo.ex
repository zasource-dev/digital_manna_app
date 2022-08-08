defmodule DigitalMannaApp.Nfts.SpaceXRepo do
  @moduledoc """
  A custom module repo for SpaceX NFTs
  """


  alias DigitalMannaApp.Repo
  alias DigitalMannaApp.Nfts.Schema.SpaceXNFT


  @doc """
    Fetches all the latest SpaceX nfts
  """
  def list_latest_nfts() do
    SpaceXNFT.select_spacex_nfts()
    |> SpaceXNFT.ordered_by_minted_at()
    |> Repo.all()
  end

  def inserts_all_nfts(nfts \\ []) do
    opts  = [
      on_conflict: :nothing
    ]

    Repo.insert_all(SpaceXNFT, nfts, opts)
  end

end
