# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ChessEarth.Repo.insert!(%ChessEarth.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias ChessEarth.Accounts
alias ChessEarth.Events

{:ok, david} = Accounts.create_user(%{name: "David Miotti", email: "david@muxumuxu.com", password: "muxumuxu"})
{:ok, audrey} = Accounts.create_user(%{name: "Audrey Labuxiere", email: "audrey@muxumuxu.com", password: "muxumuxu"})

IO.puts david.id
IO.puts audrey.id

for _ <- 1..10 do
  Events.create_event(%{
    name: Faker.Lorem.sentence,
    start_at: Timex.now,
    end_at: Timex.shift(Timex.now, days: 3),
    user_id: [david.id, audrey.id] |> Enum.take_random(1) |> hd
  })
end