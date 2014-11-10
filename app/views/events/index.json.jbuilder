json.array!(@events) do |event|
  json.extract! event, :id, :name, :shedule, :location, :mygmail_id
  json.url event_url(event, format: :json)
end
