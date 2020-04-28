json.events do
  json.array!(@events) do |event|
    json.partial! 'event', event: event
  end                                          
end

json.partial! 'v1/shared/pagination', collection: @events

