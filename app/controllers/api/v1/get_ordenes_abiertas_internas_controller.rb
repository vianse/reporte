class Api::V1::GetOrdenesAbiertasInternasController <ApplicationController
	include ActionView::Helpers::NumberHelper
	def index

		@app = App.select("api_key").where(:user_id => current_user.id)
		@acceso = Acceso.select("app_id").where(:user_id => current_user.id)
		@configuracion = Configuracion.select(:internas).where(:app_id => @acceso)
		@catalogo = Pendiente.select("orden","importe").where(:app_id => @acceso).where(:tipo => @configuracion).order("importe DESC")
		elementos = @catalogo.map do |k|
			{	
			:orden => k.orden,
			:importe => number_to_currency(k.importe)
			}
			end
			render json: elementos
	end
end