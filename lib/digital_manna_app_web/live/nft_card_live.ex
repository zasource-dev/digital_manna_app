defmodule DigitalMannaAppWeb.Live.NftCardLive do
  @moduledoc false

  use DigitalMannaAppWeb, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="flex justify-center">
      <div class="flex flex-col md:flex-row md:max-w-xl rounded-lg bg-white shadow-lg min-w-full min-h-full">
        <img class=" w-full h-96 md:h-auto object-cover md:w-48 rounded-t-lg md:rounded-none md:rounded-l-lg" src={@nft.image} alt="" />
        <div class="p-6 flex flex-col justify-start">
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
