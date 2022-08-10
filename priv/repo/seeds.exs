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
      "dateMinted" => "1660107807",
      "id" => "0xebc4e367334fe68e48080143211f95fb922c9f83-5",
      "tokenIPFSPath" => "Qmcd1Lo228z7hXWRMopb8aNkd3JKjHNxMB1TLyrHFfPbaY/metadata.json"
    },
    %{
      "dateMinted" => "1660107627",
      "id" => "0xebc4e367334fe68e48080143211f95fb922c9f83-4",
      "tokenIPFSPath" => "QmYbHkSAzpyeBJp5nKbSQEgVd4aUhp7mzstFoR2DaMVD3M/metadata.json"
    },
    %{
      "dateMinted" => "1660107516",
      "id" => "0xebc4e367334fe68e48080143211f95fb922c9f83-3",
      "tokenIPFSPath" => "QmT6iAer2YeLZQj9XHLwAwRiXvmEgDDJQGx9FxkAi9dxjU/metadata.json"
    },
    %{
      "dateMinted" => "1660107344",
      "id" => "0xebc4e367334fe68e48080143211f95fb922c9f83-2",
      "tokenIPFSPath" => "QmQYGsvhixuT4f2L5h74onxhPtQntiK9pD4HG7e43wgLub/metadata.json"
    },
    %{
      "dateMinted" => "1660107283",
      "id" => "0x5423130ab4a05bb06cfc7fc5032d479956106c9d-1",
      "tokenIPFSPath" => "QmfCWXH6idvmdVkMBKYtpTMY5rrExjJRJaURPY8FyjXCRG/metadata.json"
    },
    %{
      "dateMinted" => "1660107055",
      "id" => "0x3194cc78d9c13d7dae1f17342f6575ffc7c47d1f-3",
      "tokenIPFSPath" => "QmcJHk9xUqSqPC76SvtkRrXfgAXsY3wseWbRZAS1g6e1e6/metadata.json"
    },
    %{
      "dateMinted" => "1660107055",
      "id" => "0x25ba00383e42823da862c25ed1454b888d9dac64-9",
      "tokenIPFSPath" => "QmQT4WYEYmtdY1c4ZiVNeWsun1mR4w2HZjdhPWaDNb8xeg/metadata.json"
    },
    %{
      "dateMinted" => "1660106945",
      "id" => "0xebc4e367334fe68e48080143211f95fb922c9f83-1",
      "tokenIPFSPath" => "QmXF7AEhMUKFRh32GcKtwovg6sgXFUTcTkdbdo6oko4hxm/metadata.json"
    },
    %{
      "dateMinted" => "1660106912",
      "id" => "0xff8c11afda9da37872496e91e3cda93ea1604a4b-9",
      "tokenIPFSPath" => "QmZP9Kp7bQdKEsyCVNrMRbt1kw869SCMXYyW7opGQwvwyK/metadata.json"
    },
    %{
      "dateMinted" => "1660106819",
      "id" => "0xf65a8371637a17e57c0d17cccca42f1c92adc21f-7",
      "tokenIPFSPath" => "Qmcs4QaC4uJto8Uenz8vLPv6XAQF43eezNartgdx5aqnua/metadata.json"
    }
]
