class Api::V1::CrearOrdenesController <ApplicationController
 skip_before_filter :verify_authenticity_token
	def index	

	# #@importe = params[:importe].gsub(/[^\d]/, '').to_f
	# @importe = :importe.match(/(\d.+)/)[1].gsub(',','').to_f

	# @validar = App.where(api_key: params[:app_id]).first
	# if  @validar.blank?
 #     	 render json: {
 #     	 	message: "Cadena no valida"
 #     	 	}
 #     else
 #      @crear_ordenes    = Pendiente.new(
 #      :orden => params[:orden], 
 #      :tipo  => params[:tipo], 
 #      :importe  => @importe,
 #      :fecha => params[:fecha],
 #      :estatus => params[:estatus],
 #      :app_id => params[:app_id]
 #      )
 #      if @crear_ordenes.save
 #        render json: {
 #        	message: "Datos guardados satisfactoriamente.#{@importe}"
 #        }
 #      else
 #        render json: {
 #        	message: "No se puedo guardar, verifica que los datos datos sean los permitidos #{@crear_ordenes.errors}", status: :unprocessable_entity
 #        } 
 #      end
 #     end
	end
def create
#@importe = params[:importe].gsub(/[^\d]/, '').to_f

	@importe = params[:importe].match(/(\d.+)/)[1].gsub(',','').to_f

	@validar = App.where(api_key: params[:app_id]).first
	if  @validar.blank?
     	 render json: {
     	 	message: "Cadena no valida"
     	 	}
     else
      @crear_ordenes    = Pendiente.new(
      :orden => params[:orden], 
      :tipo  => params[:tipo], 
      :importe  => @importe,
      :fecha => params[:fecha],
      :estatus => params[:estatus],
      :app_id => params[:app_id]
      )
      if @crear_ordenes.save
        render json: {
        	message: "Datos guardados satisfactoriamente."
        }
      else
        render json: {
        	message: "No se puedo guardar, verifica que los datos datos sean los permitidos #{@crear_ordenes.errors}", status: :unprocessable_entity
        } 
      end
     end

	
	end

end