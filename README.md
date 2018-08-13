# 👑 chess.earth

This project is a GraphQL API written in [Elixir](https://elixir-lang.org/).

👉 [GraphQL Endpoint](https://api.chess.earth/graphiql)<br/>

## 🛠 Installation

To start your Phoenix server:

  * Install [Postgres.app](https://postgresapp.com/) and launch it.
  * Install dependencies with `mix deps.get`
  * Create, migrate and seed your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit the GraphiQL interface [`localhost:4000/graphiql`](http://localhost:4000/graphiql ) from your browser.

## 👨🏽‍💻 Everyday actions

```shell
mix phx.server # Launch the server
iex -S mix # Launch the console

mix ecto.create # Create the database
mix ecto.migrate # Migrate the database schema
mix run priv/repo/seeds.exs # Run seeds
mix ecto.reset # Create, migrate & seed

heroku run mix ecto.migrate # Run a migration on Heroku
```

*You can find exemples of GraphQL queries and mutations [here](https://raw.githubusercontent.com/dmiotti/chess_earth_api/master/docs/sample_queries.gql).*

## 🗺 Database Schema

![Database Schema](https://raw.githubusercontent.com/dmiotti/chess_earth_api/master/docs/database_schema.png)

## 🥞 Stack

👉 [Phoenix](https://phoenixframework.org/), back-end framework.<br/>
👉 [Heroku](https://dashboard.heroku.com/apps/api-chess-earth), where the code is hosted.<br/>

## 🏗 Deployments

Every commit on the `master` branch triggers a deployment on [Heroku](https://dashboard.heroku.com/apps/api-chess-earth).

## 🎳 Developers

- [David Miotti](mailto:david@muxumuxu.com)

## 📖 Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
  * Run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

---

Made with ❤ by [David Miotti](https://david.show).