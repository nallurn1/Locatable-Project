json.extract! user_profile, :id, :user_name, :user_email, :user_phone, :user_address_line1, :user_address_line2, :user_city, :user_state, :user_zipcode, :user_country, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)
