defmodule DigitalMannaApp.Helpers.URLHelper do



  @endpoint_ipfs Application.get_env(:digital_manna_app, :ipfs_url)


  def ipfs_url(token_ipfs_path), do: "#{@endpoint_ipfs}/#{token_ipfs_path}"

end
