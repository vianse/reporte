json.array!(@crms) do |crm|
  json.extract! crm, :id, :app_id, :sucursal_id, :group_id, :asesor_id, :fecha, :fecha_salida, :key, :mes, :año, :tipo, :dias, :cliente, :telefono, :verificacion
  json.url crm_url(crm, format: :json)
end
