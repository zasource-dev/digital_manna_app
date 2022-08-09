defmodule DigitalMannaAppTest.Factory do
  @moduledoc """
  This module provides factory functions for setting up data to test
  with.
  """
  use ExMachina.Ecto, repo: DigitalMannaApp.Repo

  use DigitalMannaAppTest.FoundationNFTFactory
end
