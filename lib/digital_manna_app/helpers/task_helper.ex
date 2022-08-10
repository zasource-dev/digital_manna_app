defmodule DigitalMannaApp.Helpers.TaskHelper do
  @moduledoc """
  A Task module for assisting with nft intensive tasks
  """

  import DigitalMannaApp.Helpers.MapHelper

  @ipfs_http_client Application.get_env(:digital_manna_app, :ipfs_http_client)

  def build_ifps_nfts(nfts) do
   with {:ok, ipfs_nft_tokens } <- only_ipfs_tokens(nfts),
      {:ok, nft_tasks} <- batch_nfts_tasks(ipfs_nft_tokens)
    do
      nft_tasks
   end
  end

  def get_ipfs_results(nft_tasks) do
    resulted_nfts = nft_tasks
    |> Enum.map(&Task.await/1)

    {:ok, resulted_nfts}
  end


  defp batch_nfts_tasks(nfts) do
    nft_tasks = nfts |> Enum.map(&build_task_async/1)
    {:ok, nft_tasks}
  end

  defp build_task_async(_nft = %{"id" => _id, "dateMinted" => _dateMinted ,  "tokenIPFSPath" => tokenIPFSPath}) do
    Task.async(fn -> @ipfs_http_client.get!(tokenIPFSPath) end)
  end

end
