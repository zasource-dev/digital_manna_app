defmodule DigitalMannaAppWeb.Live.NftsDashboardLive do
  @moduledoc false

  use DigitalMannaAppWeb, :live_view
  alias DigitalMannaApp.Nfts.Manna, as: MannaNFTs

  # Components
  alias DigitalMannaAppWeb.Live.NftCardLive


  def mount(_params, _session, socket) do

    if connected?(socket) do
      :timer.send_interval(1000, self(), :update_dashboard)
    end


    socket = assign_nfts(socket)

    {:ok, socket}
  end

  def render(assigns) do

    ~H"""
      <%= if length(@nfts) > 0 do %>
      <div class="grid  grid-cols-3 gap-4">
          <%= for nft <- @nfts  do %>
            <%= live_component(NftCardLive, nft: nft) %>
          <% end %>
      </div>
      <% end %>
    """
  end

  def handle_info(:update_dashboard, socket) do
    socket = assign_nfts(socket)
    {:noreply, socket}
  end


  defp assign_nfts(socket) do
    assign(socket,
      nfts: MannaNFTs.list_latest_nfts()
    )
  end
end
