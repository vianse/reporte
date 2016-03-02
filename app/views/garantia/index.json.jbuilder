json.array!(@garantia) do |garantium|
  json.extract! garantium, :id, :key, :date
  json.url garantium_url(garantium, format: :json)
end
