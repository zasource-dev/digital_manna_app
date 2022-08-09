defmodule DigitalMannaAppTest.FoundationNFTFactory do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      def foundation_nft_factory do
        %DigitalMannaApp.Nfts.Schema.FoundationNFT{
          nft_id: Faker.Blockchain.Ethereum.address(),
          name: Faker.Pokemon.name(),
          description: Faker.Lorem.paragraph(),
          image: Faker.Internet.image_url(),
          minted_at: DateTime.utc_now() |> DateTime.truncate(:second)
        }
      end
    end
  end
end
