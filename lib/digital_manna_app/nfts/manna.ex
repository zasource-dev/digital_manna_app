defmodule DigitalMannaApp.Nfts.Manna do
  @moduledoc """
  An interface that encapsulates NFT access
  """

  alias DigitalMannaApp.Nfts.SpaceXRepo
  alias DigitalMannaApp.Nfts.FoundationRepo

  defdelegate list_latest_nfts(), to: SpaceXRepo

  defdelegate list_most_recent_nfts(), to: FoundationRepo

  defdelegate add_foundation_nft(nft), to: FoundationRepo

end
