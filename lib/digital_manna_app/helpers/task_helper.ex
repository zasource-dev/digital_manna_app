defmodule DigitalMannaApp.Helpers.TaskHelper do
  @moduledoc """
  A Task module for assisting with nft intensive tasks
  """

  import DigitalMannaApp.Helpers.MapHelper

  @ipfs_http_client Application.compile_env(:digital_manna_app, :ipfs_http_client)

  def build_ifps_nfts(nfts) do
   with {:ok, ipfs_nft_tokens } <- only_ipfs_tokens(nfts)
    do
      ipfs_nft_tokens
   end
  end

end
