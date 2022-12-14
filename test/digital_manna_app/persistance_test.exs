defmodule DigitalMannaAppTest.PersistanceTest do
  @moduledoc false


  use ExUnit.Case


  alias DigitalMannaApp.Nfts.Persistance



  test "that persistance layer saves new nfts kw " do

    new_nft = [description: "This track talks of the struggle of leaving these toxic people which includes his ex girlfriend, who basically knows each and everything about him and how alone and insecure he feels now, when she's not around. Speciality about this track is that it's produced by SangeetKir. Adding up to the surprise, Pinnocio who's responsible for the whole beautiful soundscape has also stepped up on the mic for the very first time as a collaborative rapper alongside Mark.\n\nUtilities:\n1. Online listining party\n\n2. Priority Access on next song drop\n\n3. Video call with Mark & Pinnocio\n\n4. Primary collector of this NFT gets credits in all music videos of K.O.D\n\n5. The holder of this NFT gets 1 Backstage access to any 1 Mark Bhatia / Pinnocio Gig from August 2022 - February 2022\n\n6. The funds generated by this NFT will be used to produce the video for the same, therefore the collector gets special Producer credits.\n\n7. The 1/1 Music Video NFT of this track will be transfered to the primary collector.", image: "ipfs://QmYsJtKqcwFQyMt5R9dtQZRfxEZdTPxSGWELeNMY3H5Hjv/nft.mp4", name: "Insecurities"]

     {:ok, result_nft } = Persistance.save_nft(new_nft)

     assert result_nft |> Map.has_key?("nft_id")
  end

end
