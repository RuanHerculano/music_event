json.artists do
  json.array!(@artists) do |artist|
    json.partial! 'artist', artist: artist
  end            
end

json.partial! 'v1/shared/pagination', collection: @artists
