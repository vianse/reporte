json.array!(@payments) do |payment|
  json.extract! payment, :id, :app_id, :importe, :fecha, :dias, :estatus
  json.url payment_url(payment, format: :json)
end
