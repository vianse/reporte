json.array!(@pagos) do |pago|
  json.extract! pago, :id, :app_id, :mes, :año
  json.url pago_url(pago, format: :json)
end
