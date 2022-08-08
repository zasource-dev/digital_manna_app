defmodule DigitalMannaApp.Nfts.Schema.SpaceXNFT do
  @moduledoc """
  A SpaceX NFTs Schema definition
  """

  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias __MODULE__

  @required_fields [:nft_id, :name, :description, :image, :minted_at]

  schema "spacex_nfts" do
    field :description, :string
    field :image, :string
    field :name, :string
    field :nft_id, :string
    field :minted_at, :utc_datetime
  end

  @doc false
  def changeset(spacex_nft, attrs) do
    spacex_nft
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:nft_id)
  end

  def select_spacex_nfts() do
    from spx in SpaceXNFT, as: :spacex_nft
  end

  def is_nft_id(query, nft_id) do
    from [spacex_nft: spx] in query, where: spx.nft_id == ^nft_id
  end
  def ordered_by_minted_at(query) do
    from [spacex_nft: spx] in query, order_by: [desc: :minted_at]
  end

end
