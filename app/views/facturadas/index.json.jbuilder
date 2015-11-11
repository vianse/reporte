json.array!(@facturadas) do |facturada|
  json.extract! facturada, :id, :orden, :tipo, :importe, :fecha, :estatus, :app_id, :factura
  json.url facturada_url(facturada, format: :json)
end
