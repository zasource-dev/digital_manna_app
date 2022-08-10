defmodule DigitalMannaApp.Nfts.FoundationRepo do
  @moduledoc """
    A custom module repo for Foundation NFTs
  """

  alias DigitalMannaApp.Repo
  alias DigitalMannaApp.Nfts.Schema.FoundationNFT


   @doc """
    Fetches all the latest SpaceX nfts
  """
  def list_most_recent_nfts() do
    FoundationNFT.select_foundation_nfts()
    |> FoundationNFT.ordered_by_minted_at()
    |> Repo.all()
  end

  def add_foundation_nft(attrs \\ %{}) do
    %FoundationNFT{}
    |> FoundationNFT.changeset(attrs)
    |> Repo.insert()
  end
end
