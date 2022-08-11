import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :digital_manna_app, DigitalMannaApp.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "digital_manna_app_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :digital_manna_app, DigitalMannaAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "0LwceTwD0uwBE4X8zeA9zH6wZkpR/l7hN8WGXjXpBiQe24BjL4os5hC6AvLy9qk5",
  server: false

# In test we don't send emails.
config :digital_manna_app, DigitalMannaApp.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime


# Mock Clients
config :digital_manna_app, foundation_graph_client: DigitalMannaAppTest.Nfts.FoundationGraphQLClientMock
config :digital_manna_app, :foundation,
  url: "https://gateway.thegraph.com/api/"
