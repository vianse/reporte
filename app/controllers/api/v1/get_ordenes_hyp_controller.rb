class Api::V1::GetOrdenesHypController <ApplicationController
	include ActionView::Helpers::NumberHelper
	def index
		@parametro = params[:app_id]
		
		 	@ordenes  = Pendiente.where(:sucursal_id  => @parametro).where(:sucursal_tipo => "H")
		 	elementos = @ordenes.map do |k|
			
		 		{
		 		orden: k.orden,
		 		importe: number_to_currency(k.importe),
		 		sucursal_id: k.sucursal_id,
		 		dias: distance_of_time_in_days(k.fecha),
		 		nombre: nombre(k.sucursal_id),
		 		fecha: k.fecha
		 		} 
					end
		 	render json: elementos
	end
	private
	def distance_of_time_in_days(from_time, to_time = Date.today, include_seconds = false)
		from_time = from_time.to_time if from_time.respond_to?(:to_time)
		to_time = to_time.to_time if to_time.respond_to?(:to_time)
		distance_in_days = (((to_time - from_time).abs)/86400).round
		return distance_in_days
	end
	def nombre(val)
		nombre  = App.where(:api_key => val).where(:type_app => "Servicio").pluck(:name).first
		return nombre
	end
end