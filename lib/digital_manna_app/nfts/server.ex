defmodule DigitalMannaApp.Nfts.Server do
  @moduledoc """
   A NFT GenServer Modulw
  """

  use GenServer
  require Logger

  alias DigitalMannaApp.Nfts.Worker, as: NFTWorker
  import DigitalMannaApp.Helpers.MapHelper



  @server __MODULE__

  @foundation_http_client Application.compile_env(:digital_manna_app, :foundation_graph_client)
  @ipfs_http_client Application.compile_env(:digital_manna_app, :ipfs_http_client)


  # API
  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: @server)
  end

  # SERVER

  def init(opts) do
    {:ok, opts, {:continue, :schedule_next_run}}
  end


  @doc """
    After the genserver is ready start polling
  """
  def handle_continue(:schedule_next_run, state) do
    Process.send_after(self(), :poll_nfts, 1000)
    {:noreply, state}
  end

  @doc """
  Poll nfts data when its time to refresh
  """
  def handle_info(:poll_nfts, state) do
      Logger.info("Polling NFTs...")

      case  @foundation_http_client.fetch_nfts(50) do
        {:ok, nfts} ->
          Logger.info("Fetched NFTs...#{length(nfts)}")

          nfts
          |> only_ipfs_tokens!()
          |> batch_worker_tasks()

        {:error, message} ->
          Logger.error(message)
      end


      {:noreply, state, {:continue, :schedule_next_run}}
  end

  defp batch_worker_tasks(nfts) do
    nfts |> Enum.map(&run_worker/1)
  end

  defp run_worker(nft), do: NFTWorker.run(Agent.start_link(fn -> nft end), fn -> @ipfs_http_client.get(nft["tokenIPFSPath"]) end)
end
