class Api::V1::GetOrdenesAbiertasController <ApplicationController
	def index
		@parametro = params[:app_id]
		@app = App.select("api_key").where(:user_id => current_user.id)
		@acceso = Acceso.select("app_id").where(:user_id => current_user.id)
		@catalogo = Pendiente.where(:app_id => @parametro).count
		render json:  @catalogo
	end
end