# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DigitalMannaApp.Repo.insert!(%DigitalMannaApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

nfts = [
  %{
    "dateMinted" => "1660044336",
    "id" => "0x8feef504a78c8b7ca61f99194d2163992f6f99a8-11",
    "nftContract" => %{"name" => "Marcel 2.0"},
    "tokenIPFSPath" => "QmQ7r93feMjuYNqx6Xjs21MgkqtgttZjftAs4pQgQXSmpg/metadata.json",
    "tokenId" => "11"
  },
  %{
    "dateMinted" => "1660044196",
    "id" => "0xd271cfee27611ef275bf7dec6a9b31a1d206fa7e-6",
    "nftContract" => %{"name" => "Persona"},
    "tokenIPFSPath" => "QmQrDyYW5yEkQh6fmLVj2SXTH5xj1W1HiDDXfDup3hfiBk/metadata.json",
    "tokenId" => "6"
  },
  %{
    "dateMinted" => "1660044188",
    "id" => "0xbd50bb710642d25d2f0b9bed84393e0325ea4f43-5",
    "nftContract" => %{"name" => "the loop"},
    "tokenIPFSPath" => "QmexVESjQUiLbuRVsmEEMWC7K5EpkteznAVHb5D9NTtVmy/metadata.json",
    "tokenId" => "5"
  },
  %{
    "dateMinted" => "1660044188",
    "id" => "0x198de3d0d2d9fbb26009d5d9fd00ce5ca198eb5b-2",
    "nftContract" => %{"name" => "THIS_WORLD"},
    "tokenIPFSPath" => "QmT8pG8fDZ2stFceJW3Z24bBho9CAjWkRyC7uuhGjZ5spC/metadata.json",
    "tokenId" => "2"
  },
  %{
    "dateMinted" => "1660044121",
    "id" => "0x8feef504a78c8b7ca61f99194d2163992f6f99a8-10",
    "nftContract" => %{"name" => "Marcel 2.0"},
    "tokenIPFSPath" => "QmSa3gcgANJ2fCGjNUqzQPtjCtHMqHmy2AKBtCnKprJ4zW/metadata.json",
    "tokenId" => "10"
  },
  %{
    "dateMinted" => "1660044085",
    "id" => "0x2c717a4b74811c6eb9e1cae9921eb90af4a3b014-3",
    "nftContract" => %{"name" => "Framing Frames"},
    "tokenIPFSPath" => "QmVDpdPCmnHnTjjY8eQcgnK4xUuaL9Nfpc5qXtFMu3XBtT/metadata.json",
    "tokenId" => "3"
  },
  %{
    "dateMinted" => "1660043850",
    "id" => "0x8feef504a78c8b7ca61f99194d2163992f6f99a8-9",
    "nftContract" => %{"name" => "Marcel 2.0"},
    "tokenIPFSPath" => "QmdWZgcNWFfv4vpJfhA8dzjetZZdPmhQyhvmaYnPFYvxiM/metadata.json",
    "tokenId" => "9"
  },
  %{
    "dateMinted" => "1660043656",
    "id" => "0x2c717a4b74811c6eb9e1cae9921eb90af4a3b014-2",
    "nftContract" => %{"name" => "Framing Frames"},
    "tokenIPFSPath" => "QmaTyA9R9TGkigjaCNWDyejhDtKxvLT4F6SFTd3BDsgPhx/metadata.json",
    "tokenId" => "2"
  },
  %{
    "dateMinted" => "1660043574",
    "id" => "0x8feef504a78c8b7ca61f99194d2163992f6f99a8-8",
    "nftContract" => %{"name" => "Marcel 2.0"},
    "tokenIPFSPath" => "QmahswTo5HVmgmYRh1WkWacNL2eSxFgiSNmGENVjcNLXD6/metadata.json",
    "tokenId" => "8"
  },
  %{
    "dateMinted" => "1660043511",
    "id" => "0xba602f1daf63286cf42d7ac688b90ae40034b41d-2",
    "nftContract" => %{"name" => "Dogs on skateboard"},
    "tokenIPFSPath" => "QmU8YbU6NCPxtfWLCWKqSXi3Su4dcVb1XVr86dwsJ9mf2w/metadata.json",
    "tokenId" => "2"
  },
  %{
    "dateMinted" => "1660043438",
    "id" => "0xf005a691515ecd19e1fd61a8362843ab6f121af6-6",
    "nftContract" => %{"name" => "NFTrix OG100"},
    "tokenIPFSPath" => "Qmeh5c3xjAfpXAo2Td7gLzYaHzyY5HYBjdPBv2xrwqko6A/metadata.json",
    "tokenId" => "6"
  },
  %{
    "dateMinted" => "1660043406",
    "id" => "0x4b5b4a15eb6ea09a54edce6a8335660c36ef44d4-13",
    "nftContract" => %{"name" => "P3P3 FROG FAM FAMILY"},
    "tokenIPFSPath" => "QmfRUBH2a2KPgFsZCxkZrrBzxeDb6R4thTDaigUrS4uzAS/metadata.json",
    "tokenId" => "13"
  },
  %{
    "dateMinted" => "1660043357",
    "id" => "0x8feef504a78c8b7ca61f99194d2163992f6f99a8-7",
    "nftContract" => %{"name" => "Marcel 2.0"},
    "tokenIPFSPath" => "QmcsC4a6DHehTdxocnxEwDkDgjKBHJSbagpLvGJPPNNJRs/metadata.json",
    "tokenId" => "7"
  },
  %{
    "dateMinted" => "1660043258",
    "id" => "0x2c717a4b74811c6eb9e1cae9921eb90af4a3b014-1",
    "nftContract" => %{"name" => "Framing Frames"},
    "tokenIPFSPath" => "QmNyNj629wm82iuKwpPc5YyMZKXJ5xtHZKFJJphpbpW66k/metadata.json",
    "tokenId" => "1"
  },
  %{
    "dateMinted" => "1660043093",
    "id" => "0x469f2944baf4ca3fb76ef001f82c4afbd00270e6-39",
    "nftContract" => %{"name" => "GENESIS FROG"},
    "tokenIPFSPath" => "QmWSVVUn1VcerG4AynU1An1F1gZnwutJfGxNijSH7s1jqe/metadata.json",
    "tokenId" => "39"
  },
  %{
    "dateMinted" => "1660042960",
    "id" => "0x8feef504a78c8b7ca61f99194d2163992f6f99a8-6",
    "nftContract" => %{"name" => "Marcel 2.0"},
    "tokenIPFSPath" => "QmPs9XRRP6Ft4RYcCviZLjpQiyCWeXq5zawMXFuh8xLWqg/metadata.json",
    "tokenId" => "6"
  },
  %{
    "dateMinted" => "1660042856",
    "id" => "0x37b2e4e074dc8d4e853077e554113fc1168cccb5-4",
    "nftContract" => %{"name" => "invincible summer"},
    "tokenIPFSPath" => "QmYPw13tsZVrna943TbV72UrHPM14rxapSRESFt53Dherj/metadata.json",
    "tokenId" => "4"
  },
  %{
    "dateMinted" => "1660042815",
    "id" => "0xba75f6151379cf6d9ab35e2ff28b3fcadfbc1b19-6",
    "nftContract" => %{"name" => "Red"},
    "tokenIPFSPath" => "QmVuQyLDkj4gzmnbkR6dSaR9SC186uWLxBy8UZKLgimR6b/metadata.json",
    "tokenId" => "6"
  },
  %{
    "dateMinted" => "1660042384",
    "id" => "0xba602f1daf63286cf42d7ac688b90ae40034b41d-1",
    "nftContract" => %{"name" => "Dogs on skateboard"},
    "tokenIPFSPath" => "QmfViF4MU7cS1UoMYB9z6xyYXmm77XD6vPW76WnuXVteU9/metadata.json",
    "tokenId" => "1"
  },
  %{
    "dateMinted" => "1660042301",
    "id" => "0x36c4ef252dffc56303a6f03dd2089ac25e336f1d-3",
    "nftContract" => %{"name" => "Mothers of AI"},
    "tokenIPFSPath" => "Qmd9fwcq5mh5LdSxiURK4huVKMzdTfYSi9NhWJauHp5Cwg/metadata.json",
    "tokenId" => "3"
  }
]
