class Api::V1::CierreMesController <ApplicationController
	include ActionView::Helpers::NumberHelper
	def index
		FollowUpEmailJob.new("krlos013@gmail.com").enqueue

		@parametro = params[:app_id]
		
		@app_id     = App.where.not(:group_id => nil).pluck(:name)
		@catalogo   = Pendiente.select("orden","importe").where(:app_id => @app_id).order("importe DESC")
		@contador   = Pendiente.where(:app_id => @parametro).where(:tipo => @configuracion).count
		

		@config = Configuracion.where(:app_id => params[:app_id]).pluck(:dias_garantias).first
        @garantias = Garantium.where.not(:fecha_salida => nil).where(:mes => @mes).where(:año => @año).where(:app_id => params[:app_id])
  #       #logger.debug @garantias.to_a
  #       #logger.debug json(@garantias)
         valor = json(@garantias)
         garantia = @garantias.map do |k|
            
             dias = distance_of_time_in_days(k.fecha, k.fecha_salida)
             @dias_totales = valor.inject(0, :+)
             @conteo = valor.size
             @promedio = (@dias_totales.to_f / @conteo ).round(2) 
             @divicion = @promedio / @config.to_i  * 100
             if @divicion.round(0) > 66
                 @color = 2
             else
	             if @divicion.round(0).between?(0,33)
	                 @color = 0
	             else
		             if @divicion.round(0).between?(34,66)
		                 @color = 1
		             end
            		end
           	end
         end
         @resultado = garantia[0]

   	
		# elementos = @app.map do |k|
		# 	{	
		# 	:usuario => @email,
		# 	:sucursales => sucursales
			
			
		# 	#:conteo => @contador,
		# 	#:importe => number_to_currency(k.importe),
		# 	#:facturado => @moneda,
		# 	#:color => @resultado
		# 	}
		# 	end
		render json: {
			sucursales: sucursales
		}
		# RestClient.post "https://api:key-e7d79c66e74391fdf48b657624f23ddc@api.mailgun.net/v3/sandboxb9c2dadab0ea49f6b7130d1091646c59.mailgun.org/messages",
		#    :from => "Pronostic - Cierre de Mes <mailgun@sandboxb9c2dadab0ea49f6b7130d1091646c59.mailgun.org>",
		#    :to => "juancarlos.santiago@vianse.mx",
		#    :subject => "Cierre de Mes",
		#    :html => (render_to_string(template: "../views/email/template")).to_str
		   #:html => "<h1>Has recibido una nueva factura por el negocio Pizza PePe SA de CV</h1>"
		  


	end

private
  def distance_of_time_in_days(from_time, to_time, include_seconds = false)
    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time = to_time.to_time if to_time.respond_to?(:to_time)
    distance_in_days = (((to_time - from_time).abs)/86400).round
    return distance_in_days
  end

def json(value)
      elementos = value.map do |k|
        dias = distance_of_time_in_days(k.fecha, k.fecha_salida)
      end
      elementos
    end
def sucursales
	@año = Date.today.year
	@mes = Date.today.month
	@grupos = Group.all.uniq.pluck(:group_id)
	
	 json = @grupos.map do |a| 
	 	acceso = Acceso.where(:group_id => @grupos).pluck(:user_id)
		usuario = User.where(:id => acceso).pluck(:email)
	 	app = App.where(:group_id => @grupos)

	 	aplicaciones = app.map do |b|
	 		@facturado  = Facturada.where(:app_id => b.api_key).where(:mes => @mes).where(:anio => @año).sum(:importe)
		    @moneda     = number_to_currency(@facturado)
	 	end

	 	{
	 		:email => usuario,
	 		:facturado => @moneda
	 	}
	 	
	 	
	 	#@catalogo   = Pendiente.select("orden","importe").where(:app_id => @app_id).order("importe DESC")
	 end
	 json
	 
	 
end
 def detalles(value)
     elementos = value.map do |v|
        { 
         :nombre => v
         }
      end
      elementos.to_json
    end
end
