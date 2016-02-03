json.array!(@asesors) do |asesor|
  json.extract! asesor, :id, :nombre, :asesor_id, :user_id, :app_id
  json.url asesor_url(asesor, format: :json)
end
