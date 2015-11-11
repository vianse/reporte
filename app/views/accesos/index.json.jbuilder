json.array!(@accesos) do |acceso|
  json.extract! acceso, :id, :user_id, :app_id
  json.url acceso_url(acceso, format: :json)
end
