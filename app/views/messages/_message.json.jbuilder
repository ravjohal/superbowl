json.extract! message, :id, :header_update, :header_details, :header_pot, :created_at, :updated_at
json.url message_url(message, format: :json)
