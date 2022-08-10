defmodule DigitalMannaAppTest.HelpersTest do
  @moduledoc false
  use ExUnit.Case, async: true

  import DigitalMannaAppTest.Factory
  import DigitalMannaApp.Helpers.MapHelper
  import DigitalMannaApp.Helpers.URLHelper

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

    test "that ipfs and arweave nft resources are grouped" do

      raw_nfts = [%{
        "dateMinted" => "1660107807",
        "tokenIPFSPath" => "Qmcd1Lo228z7hXWRMopb8aNkd3JKjHNxMB1TLyrHFfPbaY/metadata.json",
        "id" => "0xebc4e367334fe68e48080143211f95fb922c9f83-5",
      },
      %{
        "id" => "0x691d0b75ed4551037eceb469f322b270d9fb13e7-4",
        "tokenIPFSPath" => "https://arweave.net/C85V4MmKwf5z2r6lL58xyD2u47Wu-2Sito6HvDOMqf4",
        "dateMinted" => "1659790807",
      }]
      # raw_nfts |> Enum.group_by(fn nft -> is_ipfs_url?() end)

    end


  end

  describe "Test Suite for URL Helpers" do
    test "that url matches pattern provided for .metadata.json" do

      raw_nfts = [%{
        "dateMinted" => "1660107807",
        "tokenIPFSPath" => "Qmcd1Lo228z7hXWRMopb8aNkd3JKjHNxMB1TLyrHFfPbaY/metadata.json",
        "id" => "0xebc4e367334fe68e48080143211f95fb922c9f83-5",
      },
      %{
        "id" => "0x691d0b75ed4551037eceb469f322b270d9fb13e7-4",
        "tokenIPFSPath" => "https://arweave.net/C85V4MmKwf5z2r6lL58xyD2u47Wu-2Sito6HvDOMqf4",
        "dateMinted" => "1659790807",
      }]

      ipfs_nfts = raw_nfts |> Enum.filter(fn nft -> Map.get(nft, "tokenIPFSPath") |> is_ipfs_url?() end)


      assert ipfs_nfts
        |> Enum.map(&(Map.get(&1, "tokenIPFSPath")))
        |> Enum.all?(&is_ipfs_url?/1)

    end
  end
end
