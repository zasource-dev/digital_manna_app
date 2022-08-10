defmodule DigitalMannaAppWeb.Live.NftCardLive do
  @moduledoc false

  use DigitalMannaAppWeb, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="flex justify-center">
      <div class="rounded-lg shadow-lg bg-white max-w-sm">
        <%= if (not String.ends_with?(@nft.image, ".mp4")) do %>
        <a href="#">

         <img class="max-w-full h-auto" src={@nft.image} alt="" />
        </a>

        <% else %>
        <video class="max-w-full h-auto" controls >
            <source src={@nft.image} type="video/webm">
            <source src={@nft.image} type="video/mp4">

            Sorry, your browser doesn't support embedded videos.
        </video>
        <% end %>
        <div class="p-6">
          <h5 class="text-gray-900 text-xl font-medium mb-2"><%= @nft.name %> </h5>
          <p class="text-gray-700 text-base mb-4">
           <%= @nft.description %>
          </p>
          <p class="text-gray-600 text-xs"><%= @nft.minted_at %></p>
        </div>
      </div>
    </div>

    """
  end
end
