json.array!(@apps) do |app|
  json.extract! app, :id, :name, :api_key
  json.url app_url(app, format: :json)
end
