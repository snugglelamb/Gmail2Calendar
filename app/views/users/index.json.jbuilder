json.array!(@users) do |user|
  json.extract! user, :id, :name, :psw, :account
  json.url user_url(user, format: :json)
end
