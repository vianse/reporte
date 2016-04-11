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
  @validar = App.where(api_key: params[:app_id]).first
  if  @validar.blank?
         render json: {
           message: "Cadena no valida"
           }
  else
   Pendiente.delete_all(:app_id => params[:app_id])
     @tipo = Configuracion.where(:app_id => params[:app_id]).pluck(:garantias).first
      #@tipo obtiene el resultado de la configuración en el campo de garantias
      ordenes_params.map do |a|
       if a[:tipo] == @tipo
         app = a[:app_id].to_s
         sucursal = a[:sucursal_id].to_s
         grupo = a[:group_id].to_s
         asesor = a[:asesor_id].to_s
         tipo = a[:tipo]
         orden = a[:orden].to_s
         clave = app + sucursal + grupo + asesor + orden
         @crear_ordenes = Pendiente.create({
          :orden => a[:orden], 
          :tipo => a[:tipo], 
          :importe => a[:importe], 
          :fecha => a[:fecha], 
          :estatus => a[:estatus], 
          :app_id => a[:app_id], 
          :sucursal_id => a[:sucursal_id],
          :group_id => a[:group_id],
          :sucursal_tipo => a[:sucursal_tipo],
          :asesor_id => a[:asesor_id].to_s,
          :key => clave
          })
         #@crear_ordenes.save
         clave1 = app + sucursal + grupo + asesor + orden
         @garantias     = Garantium.new({
          :orden => a[:orden],
          :app_id => a[:app_id].to_s,
          :sucursal_id => sucursal,
          :group_id => grupo,
          :asesor_id => asesor,
          :fecha => a[:fecha],
          :key => clave,
          :mes => Date.today.month,
          :año => Date.today.year,
          :cliente => a[:cliente],
          :telefono => a[:telefono]
          })
         
         @garantias.save
         @claves = Pendiente.where(:app_id => a[:app_id].to_s).where(:sucursal_id => a[:sucursal_id].to_s).where(:group_id => a[:group_id]).where(:asesor_id => a[:asesor_id].to_s).where(:tipo => @tipo).pluck(:key)
         
       else
         @crear_ordenes = Pendiente.create(a)
       end
         
      end
       verifica    = Garantium.select(:key,:orden,:fecha).where.not(:key => @claves)
         logger.debug "Dias #{verifica}"
          verifica.map do |b|
           @dias = distance_of_time_in_days(b.fecha)
           actualiza = Garantium.find_by_key(b.key)
           logger.debug "Dias #{actualiza.key}"
           #actualiza.update({:fecha_salida => Date.today, :dias => @dias})
          end 
        render json: {
                 message: "Datos guardados satisfactoriamente."
               }      
   end
end

  private

def distance_of_time_in_days(from_time, to_time = Date.today, include_seconds = false)
    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time = to_time.to_time if to_time.respond_to?(:to_time)
    distance_in_days = (((to_time - from_time).abs)/86400).round
    return distance_in_days
  end


  def ordenes_params
   params.require(:ordenes).map do |p|
   ActionController::Parameters.new(p.to_hash).permit(:orden, :tipo, :importe, :fecha, :estatus, :app_id, :sucursal_id,:group_id,:sucursal_tipo,:asesor_id, :key,:telefono,:cliente)
   
   end
  end
  def json(value)
      elementos = value.map do |v|
        { 
         :orden => v
         }
      end
      elementos.to_json
    end
end