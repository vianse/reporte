json.array!(@configuracions) do |configuracion|
  json.extract! configuracion, :id, :abiertas, :facturadas, :internas, :dias, :app_id
  json.url configuracion_url(configuracion, format: :json)
end
