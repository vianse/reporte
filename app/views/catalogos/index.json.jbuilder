json.array!(@catalogos) do |catalogo|
  json.extract! catalogo, :id, :mes, :año, :objetivo_real, :objetivo_obligado, :app_id, :user_id
  json.url catalogo_url(catalogo, format: :json)
end
