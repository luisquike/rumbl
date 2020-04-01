# Rumbl

Local Mode:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Production Mode:

Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

  * Initial setup
  * `mix deps.get --only prod`
  * `MIX_ENV=prod mix compile`

  * Compile assets
  * `npm run deploy --prefix ./assets`
  * `mix phx.digest`

  * Custom tasks (like DB migrations)
  * `MIX_ENV=prod mix ecto.migrate`

  * Finally run the server
  * `PORT=4001 MIX_ENV=prod mix phx.server`

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
