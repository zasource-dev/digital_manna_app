defmodule DigitalMannaAppTest.HelpersTest do
  @moduledoc false
  use ExUnit.Case, async: true

  import DigitalMannaAppTest.Factory
  import DigitalMannaApp.Helpers.MapHelper

  describe "Test Suite for Map Helpers"  do

    test "that a raw nft is a formatted foundation schema struct" do

      raw_nft = %{
        "dateMinted" => "1660044336",
        "id" => "0x8feef504a78c8b7ca61f99194d2163992f6f99a8-11",
        "nftContract" => %{"name" => "Marcel 2.0"},
        "tokenIPFSPath" => "QmQ7r93feMjuYNqx6Xjs21MgkqtgttZjftAs4pQgQXSmpg/metadata.json",
        "tokenId" => "11"
      }

      formatted_nft_map = map_nft_to_required_fields(raw_nft)

      assert formatted_nft_map |> is_map()
      assert formatted_nft_map |> Map.has_key?(:nft_id)
      assert formatted_nft_map |> Map.has_key?(:name)
      assert formatted_nft_map |> Map.has_key?(:description)
      assert formatted_nft_map |> Map.has_key?(:image)
      assert formatted_nft_map |> Map.has_key?(:minted_at)
    end
  end
end
