json.array!(@pendientes) do |pendiente|
  json.extract! pendiente, :id, :orden, :tipo, :importe, :fecha, :estatus, :app_id
  json.url pendiente_url(pendiente, format: :json)
end
