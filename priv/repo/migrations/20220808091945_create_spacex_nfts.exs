defmodule DigitalMannaApp.Repo.Migrations.CreateSpacexNfts do
  use Ecto.Migration

  def change do
    create table(:spacex_nfts) do
      add :nft_id, :string
      add :name, :string
      add :description, :text
      add :image, :string
      add :minted_at, :utc_datetime

      timestamps()
    end

    create unique_index(:spacex_nfts, [:nft_id])
  end
end
