json.genres do
  json.array!(@genres) do |genre|
    json.partial! 'genre', genre: genre
  end           
end

json.partial! 'v1/shared/pagination', collection: @genres

