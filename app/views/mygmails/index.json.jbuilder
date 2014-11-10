json.array!(@mygmails) do |mygmail|
  json.extract! mygmail, :id, :eid
  json.url mygmail_url(mygmail, format: :json)
end
