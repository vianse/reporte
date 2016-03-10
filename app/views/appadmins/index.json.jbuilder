json.array!(@appadmins) do |appadmin|
  json.extract! appadmin, :id, :app_id, :group_id, :admin_id
  json.url appadmin_url(appadmin, format: :json)
end
