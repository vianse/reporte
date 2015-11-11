class Api::V1::GetConteoInternasController <ApplicationController
	def index
		@app = App.select("api_key").where(:user_id => current_user.id)
		@acceso = Acceso.select("app_id").where(:user_id => current_user.id)
		@configuracion = Configuracion.select(:internas).where(:app_id => @acceso)
		@catalogo = Pendiente.where(:app_id => @acceso).where(:tipo => @configuracion).count
		render json: @catalogo
	end	
end