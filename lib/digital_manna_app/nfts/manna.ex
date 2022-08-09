defmodule DigitalMannaApp.Nfts.Manna do
  @moduledoc """
  An interface that encapsulates NFT access
  """

  alias DigitalMannaApp.Nfts.SpaceXRepo

  defdelegate list_latest_nfts(), to: SpaceXRepo

end
