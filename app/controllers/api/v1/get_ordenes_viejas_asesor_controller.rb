class Api::V1::GetOrdenesViejasAsesorController <ApplicationController
include ActionView::Helpers::NumberHelper
	def index
		@parametro = params[:app_id]
		@parametro1 = params[:id]
		@asesores = Asesor.where(:user_id => current_user.id).pluck(:asesor_id).first
		@catalogo = Pendiente.where(:app_id => @parametro).where(:asesor_id => @asesores).order(fecha: :asc)
		
		elementos = @catalogo.map do |k|
		@dias = distance_of_time_in_days(k.fecha)
			{
				:orden => k.orden,
				:tipo => k.tipo,
				:importe => number_to_currency(k.importe),
				:fecha => k.fecha,
				:dias => @dias
				
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

end