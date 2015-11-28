class Api::V1::GetSucursalesHypController <ApplicationController
	include ActionView::Helpers::NumberHelper
	def index
		@parametro = params[:app_id]
		#@acceso = Acceso.where(:user_id => current_user.id).where(:app_id_h => @parametro).pluck(:app_id_h).first
		@app    = App.where(:api_key => @parametro).pluck(:group).first
		#render json: @app
		 if @app.blank?
		 	render json: {
		 		message: @app
			}
		 else
		# 	if @acceso.blank?
		# 			@app    = App.where(:api_key => @parametro).pluck(:api_key).first
		# 			@acceso = Acceso.where(:user_id => current_user.id).where(:app_id_h => @parametro).pluck(:app_id_h).first
		# 			if @app.blank?
		# 				render json: {
		# 					message: "El App Id no existe, favor de intentar nuevamente."
		# 				}
		# 			else
		# 				if @acceso.blank?
		# 					render json: {
		# 						:name => "Sin Acceso"
		# 					}
		# 				else

		# 			   @empresa = App.select("name").where(:api_key => @parametro)
		# 			   elementos = @empresa.map do |k|
		# 					{	
		# 					:Sucursal => k.name,
		# 					}
		# 					end
		# 				render json: elementos
		# 				end
		# 			end

		# 	else
		 	   @empresa  = App.select(:name, :api_key).where(:group => @app).where(:type_app => "Servicio")
		 	   elementos = @empresa.map do |k|
		 	   	 @contar = Pendiente.where(:sucursal_id => k.api_key).where(:sucursal_tipo => "H").count
				 @ordenes = Pendiente.select("importe").where(:sucursal_id => k.api_key).where(:sucursal_tipo => "H")
				 
		 	   	# @sumar  = Pendiente.where(:sucursal_id => k.api_key).pluck(:importe)
		 	   	 @moneda = @ordenes.map {|s| s['importe']}.reduce(0, :+)
		 	   	# @dias = distance_of_time_in_days(@fecha)
		 			{	
		 			:Sucursal => k.name,
		 			:app_id => k.api_key,
		 			:conteo => @contar,
		 			:importe => number_to_currency(@moneda)
		 
		 			}
		 			end
		 		render json: elementos
		 	end
		# end
		
	end
	private
	def distance_of_time_in_days(from_time, to_time = Date.today, include_seconds = false)
		from_time = from_time.to_time if from_time.respond_to?(:to_time)
		to_time = to_time.to_time if to_time.respond_to?(:to_time)
		distance_in_days = (((to_time - from_time).abs)/86400).round
		return distance_in_days
	end
end