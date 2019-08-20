json.extract! appointment, :id, :name, :email, :message, :date, :status, :is_accepted?, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
