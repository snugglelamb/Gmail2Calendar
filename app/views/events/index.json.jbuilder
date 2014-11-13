json.array!(@events) do |event|
  json.extract! event, :id, :name, :schedule, :location, :mygmail_id
  json.url event_url(event, format: :json)
end
