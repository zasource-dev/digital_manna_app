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
  def run(fun) do
    GenServer.cast(@me, {:run, fun})
  end

  def handle_cast({:run, fun}, state) do
    Task.async(fun)
    {:noreply, state}
  end

  def handle_info({_task, {:ok, result}}, state) do
    Logger.info("#{inspect(result)}")
    # 1. Save resulted nfts
    Persistance.save_nft(result.body)

    {:noreply, state}
  end

  def handle_info({_task, {:error, reason}}, state) do
    Logger.error("Failed to complete job: #{reason}")
    {:noreply, state}
  end


  def handle_info(_, state), do: {:noreply, state}
end
