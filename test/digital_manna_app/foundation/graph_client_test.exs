defmodule DigitalMannaAppTest.Nfts.FoundationGraphClientTest do
 @moduledoc false
 use ExUnit.Case
 import Mox



 @foundation_graph_client Application.compile_env(:digital_manna_app, :foundation_graph_client)
 @foundation_graph_url Application.compile_env(:digital_manna_app, :foundation)[:url]

 setup :verify_on_exit!

 setup do

    mock_response_body_nfts = [%{
        "dateMinted" => "1660044336",
        "id" => "0x8feef504a78c8b7ca61f99194d2163992f6f99a8-11",
        "nftContract" => %{"name" => "Marcel 2.0"},
        "tokenIPFSPath" => "QmQ7r93feMjuYNqx6Xjs21MgkqtgttZjftAs4pQgQXSmpg/metadata.json",
        "tokenId" => "11"
    }]

    DigitalMannaAppTest.Nfts.FoundationGraphQLClientMock
    |> expect(:connect, fn _ -> :ok end)
    |> expect(:fetch_nfts, fn _ -> mock_response_body_nfts end)

    {:ok, %{mock_response_body_nfts: mock_response_body_nfts} }
 end


 test "that we get a list of nfts from the foundation client", _context do

  assert @foundation_graph_client.connect(@foundation_graph_url) == :ok
  assert @foundation_graph_client.fetch_nfts(10) |> is_list()
 end
end
