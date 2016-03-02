class Api::V1::GetCompetenciasController <ApplicationController
	include ActionView::Helpers::NumberHelper
	def index
		@parametro = params[:app_id]
		@parametro1 = params[:id]
		@año = Date.today.year
		@mes = Date.today.month
		@asesores = Asesor.where(:user_id => current_user.id).pluck(:asesor_id).first
		@configuracion = Configuracion.select(:internas).where(:app_id => @parametro)
		@asesor   = Facturada.where(:app_id => @parametro).where(:mes => @mes).where(:anio => @año).where.not(:tipo => @configuracion).order(importe: :desc).pluck(:asesor_id).first
		@catalogo = Facturada.select("importe","asesor_id").where(:asesor_id => @asesor).sum(:importe)

		if @asesor === @asesores
			render json: {
			:costo => 1
			}
		else
			render json: {
			:costo => number_to_currency(@catalogo)
			}
		end
	end
end