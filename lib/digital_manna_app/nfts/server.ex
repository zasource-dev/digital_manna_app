defmodule DigitalMannaApp.Nfts.Server do
  @moduledoc """
   A NFT GenServer Modulw
  """

  use GenServer
  alias DigitalMannaApp.Nfts.Persistance

  # API
  def start_link(api) do
    GenServer.start_link(__MODULE__, api)
  end

  # SERVER

  def init(api) do
    {:ok, %{:api => api}, {:continue, :schedule_next_run}}
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
    case Persistance.fetch_and_update_nfts(state.api) do
      {:ok, _message} -> {:noreply, state, {:continue, :schedule_next_run}}
      err ->  IO.inspect(err)

    end
  end
end
