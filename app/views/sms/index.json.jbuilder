json.array!(@sms) do |sm|
  json.extract! sm, :id, :telefono, :mensaje, :url, :respuesta, :comentario, :app_id, :group_id, :user_id
  json.url sm_url(sm, format: :json)
end
