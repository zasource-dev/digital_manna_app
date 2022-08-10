defmodule DigitalMannaApp.Nfts.FoundationRepo do
  @moduledoc """
    A custom module repo for Foundation NFTs
  """

  alias DigitalMannaApp.Repo
  alias DigitalMannaApp.Nfts.Schema.FoundationNFT

  require Logger


   @doc """
    Fetches all the latest SpaceX nfts
  """
  def list_most_recent_nfts() do
    FoundationNFT.select_foundation_nfts()
    |> FoundationNFT.ordered_by_minted_at()
    |> FoundationNFT.limit_to(20)
    |> Repo.all()
  end

  def get_one_nft(id) do
      FoundationNFT.select_foundation_nfts()
      |> FoundationNFT.is_nft_id(id)
      |> Repo.exists?()
  end

  def add_foundation_nft(attrs \\ %{}) do

    case  get_one_nft(attrs.nft_id)  do
      true -> Logger.error("NFT already Exists")
      false ->
        Logger.error("Adding new Foundation NFT")
        insert_nft_entry(attrs)
    end

  end

  defp insert_nft_entry(attrs) do
    %FoundationNFT{}
    |> FoundationNFT.changeset(attrs)
    |> Repo.insert()
  end
end
