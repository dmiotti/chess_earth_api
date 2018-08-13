defmodule Mix.Tasks.ChessEarth.Import do
  use Mix.Task

  @latest_events_url "http://www.echecs.asso.fr/ListeTournois.aspx?Action=TOURNOICOMITE&ComiteRef="
  # @event_url "http://www.echecs.asso.fr/FicheTournoi.aspx?Ref="

  def run(_args) do
    HTTPoison.start

    # Get FFE ids
    ids = HTTPoison.get!(@latest_events_url <> "33").body
    |> Floki.find(".page-mid tr")
    |> Floki.find("td:nth-child(1)")
    |> Enum.filter(
      fn(td) ->
        Enum.at(Floki.attribute(td, "class"), 0) != "liste_titre"
      end)
    |> Enum.map(fn(td) -> Floki.text(td) end)

    IO.inspect ids
  end
end
