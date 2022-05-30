json.extract! user_location, :id, :user_location_street, :user_location_city, :user_location_state, :user_location_country, :created_at, :updated_at
json.url user_location_url(user_location, format: :json)
