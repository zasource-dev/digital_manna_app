defmodule DigitalMannaApp.Repo.Migrations.CreateFoundationNfts do
  use Ecto.Migration

  def change do
    create table(:foundation_nfts) do
      add :nft_id, :string
      add :name, :string
      add :description, :text
      add :image, :string
      add :minted_at, :utc_datetime

    end

    create unique_index(:foundation_nfts, [:nft_id])
  end
end
