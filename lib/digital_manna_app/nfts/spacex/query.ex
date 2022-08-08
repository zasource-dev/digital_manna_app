defmodule DigitalMannaApp.Nfts.SpaceXApi.Query do
  @moduledoc """
  A module for defining graphql queries for SpaceX API

  """

  @ships_query """
    {
      ships {
        image
        id
        name
        mmsi
        type
      }
    }
  """


  @doc """
   Returns a graphql query for fetching ships
  """
  @spec get_ships_query :: String.t
  def get_ships_query(), do: @ships_query
end
