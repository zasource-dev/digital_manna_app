defmodule DigitalMannaApp.Helpers.URLHelper do
  @moduledoc """
    A URL Helper to assist with nft url resources
  """

  @endpoint_ipfs Application.get_env(:digital_manna_app, :ipfs_url)


  def is_ipfs_url?(token_ipfs_path), do: String.ends_with?(token_ipfs_path, "/metadata.json")
  def is_arweave_url?(token_ipfs_path), do: String.starts_with?(token_ipfs_path, "https://arweave.net/")

  defp ipfs_url(token_ipfs_path), do: "#{@endpoint_ipfs}/#{token_ipfs_path}"
  defp arweave_url(token_ipfs_path), do: token_ipfs_path

end
