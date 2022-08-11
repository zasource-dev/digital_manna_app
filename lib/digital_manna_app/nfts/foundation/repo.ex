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
      insert_nft_entry(attrs)
  end

  defp insert_nft_entry(attrs) do
    inserts_all_nfts([attrs])
  end

  defp inserts_all_nfts(nfts) do
    opts  = [
      on_conflict: :nothing
    ]

    Repo.insert_all(FoundationNFT, nfts, opts)
  end


end
