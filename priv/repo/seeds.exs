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

{:ok, %{ id: user_id }} = Accounts.create_user(
  %{name: "David Miotti", email: "david@muxumuxu.com", password: "muxumuxu"}
)

for _ <- 1..10 do
  Events.create_event(
    %{
      name: Faker.Lorem.sentence,
      start_at: Timex.now,
      end_at: Timex.shift(Timex.now, days: 3),
      user_id: user_id,
      address: %{
        formatted_address: "196 Rue Guillaume Leblanc, 33000 Bordeaux France",
        street: "Rue Guillaume Leblanc",
        street_number: "196",
        lat: "44.861824",
        lng: "-0.567678",
        city: "Bordeaux",
        country: "France",
        country_code: "FR"
      }
    }
  )
end