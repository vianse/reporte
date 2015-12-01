class Api::V1::GetDiasController <ApplicationController
	def index
		@parametro = params[:app_id]
		@alerta      = Payment.where(:app_id => @parametro).pluck(:fechavencimiento).last
	    @dias_config = Payment.where(:app_id => @parametro).pluck(:diascorteacceso).last
	    @dias_alerta = Payment.where(:app_id => @parametro).pluck(:diasalerta).last
	    @dias = distance_of_time_in_days(@alerta)
	    
	    if @dias.to_i > 0 and @dias.to_i <= @dias_alerta.to_i
	     render json: 
	     {:dias => @dias.to_i,
	      :alerta => 1,
	     
	     }
	 	else
	 	if @dias.to_i == 0
	     pago = Payment.where(app_id: params[:app_id]).last
		 pago.update(estatus: 1)
		else
			render json: 
	     {:dias => @dias.to_i,
	      :alerta => 0,
	     
	     }
		end
	    end
	    
	end	
	private
  def distance_of_time_in_days(from_time, to_time = Date.today, include_seconds = false)
    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time = to_time.to_time if to_time.respond_to?(:to_time)
    distance_in_days = (((to_time - from_time).abs)/86400).round
    return distance_in_days
  end
end