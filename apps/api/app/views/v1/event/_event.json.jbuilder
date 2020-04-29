json.extract! event,
  :id,
  :name

json.artists do
  json.array!(event.event_artists) do |event_artist|
    artist = event_artist.artist

    json.id artist.id
    json.order event_artist.order
    json.name artist.name
  end
end

json.genres do
  json.array!(event.genres) do |genre|
    json.id genre.id
    json.name genre.name
  end
end
