defmodule DigitalMannaApp.Repo do
  use Ecto.Repo,
    otp_app: :digital_manna_app,
    adapter: Ecto.Adapters.Postgres
end
