class Api::V1::GetOrdenesMayoresController <ApplicationController
	include ActionView::Helpers::NumberHelper
	def index
		@app = App.select("api_key").where(:user_id => current_user.id)
		@acceso = Acceso.select("app_id").where(:user_id => current_user.id)
		@configuracion = Configuracion.where(:app_id => @acceso).pluck(:dias).first
		@fecha = Date.today() - @configuracion.to_i #Fecha con la resta del parametro
		@catalogo = Pendiente.where(:app_id => @acceso).where("fecha < ?", @fecha).order("fecha ASC")
		
		elementos = @catalogo.map do |k|
		@dias = distance_of_time_in_days(k.fecha)
			{
				:orden => k.orden,
				:fecha => k.fecha,
				:dias => @dias,
				:importe => number_to_currency(k.importe)
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