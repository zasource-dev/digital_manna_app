defmodule DigitalMannaApp.Nfts.Schemas.SpaceXNFT do
  @moduledoc """
  A SpaceX NFTs Schema definition
  """
  use Ecto.Schema
  import Ecto.Changeset

  @expected_fields [:nft_id, :name, :description, :image, :minted_at]

  schema "spacex_nfts" do
    field :description, :string
    field :image, :string
    field :name, :string
    field :nft_id, :string
    field :minted_at, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(spacex_nft, attrs) do
    spacex_nft
    |> cast(attrs, @expected_fields)
    |> validate_required(@expected_fields)
    |> unique_constraint(:nft_id)
  end
end
