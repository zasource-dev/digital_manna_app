defmodule DigitalMannaAppTest.Nfts.FoundationRepoTest do
  @moduledoc false

  use DigitalMannaApp.DataCase, async: true

  import DigitalMannaAppTest.Factory

  alias DigitalMannaApp.Nfts.FoundationRepo

  test "that we can list foundation nfts" do
    inserted_nfts = insert_list(10, :foundation_nft)

    foundation_nfts = FoundationRepo.list_most_recent_nfts()

    assert length(inserted_nfts) == length(foundation_nfts)
  end
end
