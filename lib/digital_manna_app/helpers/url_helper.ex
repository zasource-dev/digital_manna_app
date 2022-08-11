defmodule DigitalMannaApp.Helpers.URLHelper do
  @moduledoc """
    A URL Helper to assist with nft url resources
  """

  @endpoint_ipfs Application.compile_env(:digital_manna_app, :ipfs_url)


  def match_nft_resource_url(token_ipfs_path) do
    cond do
      is_arweave_url?(token_ipfs_path) -> arweave_url(token_ipfs_path)
      is_ipfs_url?(token_ipfs_path) -> ipfs_url(token_ipfs_path)
      true -> IO.puts("Something went wrong: #{token_ipfs_path}")
    end
  end

  def get_ipfs_image_url(image_url) do
    image_url
    |> String.replace("ipfs://", "#{@endpoint_ipfs}/")
  end

  def is_ipfs_url?(token_ipfs_path), do: String.ends_with?(token_ipfs_path, "/metadata.json")
  def is_arweave_url?(token_ipfs_path), do: String.starts_with?(token_ipfs_path, "https://arweave.net/")

  defp ipfs_url(token_ipfs_path), do: "#{@endpoint_ipfs}/#{token_ipfs_path}"
  defp arweave_url(token_ipfs_path), do: token_ipfs_path

end
