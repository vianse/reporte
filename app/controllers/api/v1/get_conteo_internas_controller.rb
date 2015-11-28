class Api::V1::GetConteoInternasController <ApplicationController
	def index
		@parametro = params[:app_id]
		@app = App.select("api_key").where(:user_id => current_user.id)
		@acceso = Acceso.select("app_id").where(:user_id => current_user.id)
		@configuracion = Configuracion.select(:internas).where(:app_id => @parametro)
		@catalogo = Pendiente.where(:app_id => @parametro).where(:tipo => @configuracion).count
		render json: @catalogo
	end	
end