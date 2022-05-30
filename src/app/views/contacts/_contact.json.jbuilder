json.extract! contact, :id, :contact_name, :contact_email, :contact_phone, :contact_relation, :created_at, :updated_at, :user_id
json.url contact_url(contact, format: :json)