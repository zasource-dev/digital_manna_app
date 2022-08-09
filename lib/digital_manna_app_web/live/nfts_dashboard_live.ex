defmodule DigitalMannaAppWeb.Live.NftsDashboardLive do
  @moduledoc false

  use DigitalMannaAppWeb, :live_view

  alias DigitalMannaApp.Nfts.Manna, as: MannaNFTs


  def mount(_params, _session, socket) do

    if connected?(socket) do
      :timer.send_interval(1000, self(), :update_dashboard)
    end


    socket = assign_nfts(socket)

    {:ok, socket}
  end

  def render(assigns) do

    ~H"""
      <h1>Digital Manna NFTs Dashboard</h1>
      <%= if length(@nfts) > 0 do %>
        <ul>
          <%= for nft <- @nfts  do %>
            <li> <%= nft.name %></li>
          <% end %>
        </ul>
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
