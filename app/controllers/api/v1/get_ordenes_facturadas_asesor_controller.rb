class Api::V1::GetOrdenesFacturadasAsesorController <ApplicationController
	include ActionView::Helpers::NumberHelper
	def index
		@parametro = params[:app_id]
		@parametro1 = params[:id]
		@año = Date.today.year
		@mes = Date.today.month
		@configuracion = Configuracion.select(:internas).where(:app_id => @parametro)
		asesores = Asesor.where(:user_id => current_user.id).pluck(:asesor_id).first
		@catalogo = Facturada.where(:app_id => @parametro).where(:asesor_id => asesores).where(:mes => @mes).where(:anio => @año).where.not(:tipo => @configuracion).sum(:importe)
		@moneda = number_to_currency(@catalogo)
		render json: {
			:costo => @moneda
		}
	end
end