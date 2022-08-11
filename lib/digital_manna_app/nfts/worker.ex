defmodule DigitalMannaApp.Nfts.Worker do
  @moduledoc false

  use GenServer
  require Logger

  alias DigitalMannaApp.Nfts.Persistance

  @me __MODULE__

  # API
  def start_link(opts) do
    GenServer.start_link(@me, opts, name: @me)
  end

  def init(opts), do: {:ok, opts}


   # SERVER
  def run(nft, fun) do
    {:ok, nft_pid} = nft
    GenServer.cast(@me, {:run, fun, nft_pid})
  end

  def handle_cast({:run, fun, nft_pid}, state) do
    Task.async(fun)

    updated_state = [nft_pid]
    {:noreply, updated_state}
  end

  def handle_info({_task, {:ok, result}}, state) do
    Logger.info("Successfully fetch nft information!")

    Logger.info("1. Getting raw nft data...")

    # 1. Save resulted nfts
    [nft_pid | _pids_tail] = state

    %{"dateMinted" => date_minted, "id" => id, "tokenIPFSPath" => _token_ipfs_path} = nft_pid |> Agent.get(fn raw_nft -> raw_nft end)



    nft_manna_entry = [
      nft_id: id,
      name: Access.get(result.body, :name),
      description: Access.get(result.body, :description),
      image: Access.get(result.body, :image),
      minted_at: date_minted
    ]
    Logger.info("2. Saving raw nft data...")
    Logger.info("#{inspect(nft_manna_entry)}")
    Persistance.save_nft(nft_manna_entry)

    Process.exit(nft_pid, :normal)

    {:noreply, state}
  end

  def handle_info({_task, {:error, reason}}, state) do
    Logger.error("Failed to complete job: #{reason}")
    {:noreply, state}
  end


  def handle_info(_, state), do: {:noreply, state}
end
