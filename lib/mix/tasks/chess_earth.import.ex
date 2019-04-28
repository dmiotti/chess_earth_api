defmodule Mix.Tasks.ChessEarth.Import do
  use Mix.Task

  defmodule ParsedEvent do
    defstruct [:id, :name, :standings, :address, :organizer, :rounds]
  end

  @latest_events_url "http://www.echecs.asso.fr/ListeTournois.aspx?Action=TOURNOICOMITE&ComiteRef="
  @event_url "http://www.echecs.asso.fr/FicheTournoi.aspx?Ref="

  def run(_args) do
    HTTPoison.start

    # Get FFE ids
    events = HTTPoison.get!(@latest_events_url <> "33").body
    |> Floki.find(".page-mid tr")
    |> Floki.find("td:nth-child(1)")
    |> Enum.filter(fn(td) -> Enum.at(Floki.attribute(td, "class"), 0) != "liste_titre" end)
    |> Enum.map(fn(td) -> Floki.text(td) end)

    event = Enum.at(events, 0)
    raw_event = HTTPoison.get!(@event_url <> event).body
    |> Floki.find("table span")

    IO.inspect raw_event

    # |> Enum.map(
    #   fn(id) ->
    #     raw_event = HTTPoison.get!(@event_url <> id).body
    #     |> Floki.find("table span")
    #     |> Enum.map(fn(span) -> Floki.text(span) end)

    #     IO.inspect raw_event

    #     %ParsedEvent{
    #       id: id,
    #       name: Enum.at(raw_event, 0),
    #       rounds: Enum.at(raw_event, 4),
    #       standings: Enum.at(raw_event, 8),
    #       organizer: Enum.at(raw_event, 12),
    #       address: Enum.at(raw_event, 11)
    #     }
    #   end
    # )

    # IO.inspect events
  end
end
