defmodule DigitalMannaApp.Nfts.Schema.FoundationNFT do
  @moduledoc """
  A schema module for Foundation NFTs
  """
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias __MODULE__

  @required_fields [:nft_id, :name, :description, :image, :minted_at]

  schema "foundation_nfts" do
    field :description, :string
    field :image, :string
    field :name, :string
    field :nft_id, :string
    field :minted_at, :utc_datetime

  end

  @doc false
  def changeset(foundation_nft, attrs) do
    foundation_nft
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:nft_id)
  end

  def select_foundation_nfts() do
    from fnd_nft in FoundationNFT, as: :foundation_nft
  end

  def ordered_by_minted_at(query) do
    from [foundation_nft: fnd_nft] in query, order_by: [desc: :minted_at]
  end

  def is_nft_id(query, nft_id) do
    from [foundation_nft: fnd_nft] in query, where: fnd_nft.nft_id == ^nft_id
  end

  def limit_to(query, limit \\ 20) do
    from [foundation_nft: fnd_nft] in query, limit: ^limit
  end
end
