defmodule DigitalMannaApp.Nfts.Foundation.Query do
  @moduledoc """
    A module for defining graphql queries for Foundation Graph API
  """

  @recent_nfts """
  {
    nfts(orderBy: dateMinted, orderDirection: desc, first: 20) {
      id
      tokenId
      tokenIPFSPath
      dateMinted
       nftContract {
        name

       }
    }
  }
  """

  @doc """
  Returns a graph query of the most recent nfts
  """
  def get_recent_nfts(), do: @recent_nfts
end
