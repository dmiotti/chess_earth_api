defmodule ChessEarth.Mixfile do
  use Mix.Project

  def project do
    [
      app: :chess_earth,
      version: "0.0.1",
      elixir: "~> 1.8.1",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {ChessEarth.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.3"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.13.5"},
      {:gettext, "~> 0.11"},
      {:plug_cowboy, "~> 2.0"},
      {:plug, "~> 1.7"},
      {:poison, "~> 3.1.0"},
      {:absinthe, "~> 1.4.16"},
      {:absinthe_plug, "~> 1.4.2"},
      {:absinthe_ecto, git: "https://github.com/absinthe-graphql/absinthe_ecto.git"},
      {:faker, "~> 0.12.0"},
      {:timex, "~> 3.5.0"},
      {:timex_ecto, "~> 3.3.0"},
      {:comeonin, "~> 4.0"},
      {:bcrypt_elixir, "~> 1.0"},
      {:guardian, "~> 1.2.1"},
      {:expat, "~> 1.0"},
      {:ex_guard, "~> 1.3", only: :dev},
      {:cors_plug, "~> 1.5"},
      {:floki, "~> 0.20.0"},
      {:httpoison, "~> 1.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.reset", "test"],
      "ecto.create": ["ecto.create", "ecto.migrate"],
      "ecto.migrate": ["ecto.migrate", "ecto.dump"]
    ]
  end
end
