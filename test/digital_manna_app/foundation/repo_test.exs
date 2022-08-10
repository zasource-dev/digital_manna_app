defmodule DigitalMannaAppTest.Nfts.FoundationRepoTest do
  @moduledoc false

  use DigitalMannaApp.DataCase, async: true

  import DigitalMannaAppTest.Factory

  alias DigitalMannaApp.Nfts.FoundationRepo
  alias DigitalMannaApp.Nfts.Schema.FoundationNFT

  test "that we can list foundation nfts" do
    inserted_nfts = insert_list(10, :foundation_nft)

    foundation_nfts = FoundationRepo.list_most_recent_nfts()

    assert length(inserted_nfts) == length(foundation_nfts)
  end

  test "that add_foundation_nft returns a new foundation nft" do
    foundation_nft = insert(:foundation_nft)

    foundation_nft_fields = %{
      nft_id: Faker.Blockchain.Ethereum.address(),
      name: foundation_nft.name,
      description: foundation_nft.description,
      image: foundation_nft.image,
      minted_at: foundation_nft.minted_at
    }

    assert {:ok, foundation_nft} = FoundationRepo.add_foundation_nft(foundation_nft_fields)
  end
end
