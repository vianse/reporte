class Api::V1::GetCostoInternasController <ApplicationController
	include ActionView::Helpers::NumberHelper
	def index
		@app = App.select("api_key").where(:user_id => current_user.id)
		@acceso = Acceso.select("app_id").where(:user_id => current_user.id)
		@configuracion = Configuracion.select(:internas).where(:app_id => @acceso)
		@catalogo = Pendiente.select("importe").where(:app_id => @acceso).where(:tipo => @configuracion).sum(:importe)
		@moneda = number_to_currency(@catalogo)
		render json: {
			:costo => @moneda
		}
	end	
end