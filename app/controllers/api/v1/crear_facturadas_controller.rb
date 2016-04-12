class Api::V1::CrearFacturadasController <ApplicationController
 skip_before_filter :verify_authenticity_token
 def index
 	
  
 end
 def create
  @validar = App.where(api_key: params[:app_id]).first
if  @validar.blank?
       render json: {
         message: "Cadena no valida"
         }
     else
@mes = Date.today.month
@año = Date.today.year
  Facturada.where(:mes => @mes).where(:anio => @año).delete_all(:app_id => params[:app_id])
# @crear_ordenes = Facturada.create(facturas_params)

facturas_params.map do |a|

       app = a[:app_id].to_s
       sucursal = a[:sucursal_id].to_s
       grupo = a[:group_id].to_s
       asesor = a[:asesor_id].to_s
       tipo = a[:tipo]
       #clave = app.to_i + sucursal.to_i + grupo.to_i + asesor.to_i + a[:orden]
       @crear_facturas = Facturada.create({
        :orden => a[:orden], 
        :tipo => a[:tipo], 
        :importe => a[:importe], 
        :fecha => a[:fecha], 
        :estatus => a[:estatus], 
        :factura => a[:factura],
        :mes => a[:mes],
        :anio => a[:anio],
        :app_id => a[:app_id], 
        :sucursal_id => a[:sucursal_id],
        :group_id => a[:group_id],
        :sucursal_tipo => a[:sucursal_tipo],
        :asesor_id => a[:asesor_id].to_s,
       # :key => clave.to_s
        })
end
 render json: {
           message: "Datos guardados satisfactoriamente."
         }
       
end
 # 	@importe = params[:importe].match(/(\d.+)/)[1].gsub(',','').to_f
	# @validar = App.where(api_key: params[:app_id]).first
	# if  @validar.blank?
 #     	 render json: {
 #     	 	message: "Cadena no valida"
 #     	 	}
 #     else
 #      @crear_facturadas    = Facturada.new(
 #      :orden => params[:orden], 
 #      :tipo  => params[:tipo], 
 #      :importe  => @importe,
 #      :fecha => params[:fecha],
 #      :estatus => params[:estatus],
 #      :factura => params[:factura],
 #      :mes => params[:mes],
 #      :año => params[:año],
 #      :app_id => params[:app_id]
 #      )
 #      if @crear_facturadas.save
 #        render json: {
 #        	message: "Datos guardados satisfactoriamente."
 #        }
 #      else
 #        render json: {
 #        	message: "No se puedo guardar, verifica que los datos datos sean los permitidos #{@crear_ordenes.errors}", status: :unprocessable_entity
 #        } 
 #      end
 #     end	
 end
 private
  def facturas_params
   params.require(:facturadas).map do |p|
   ActionController::Parameters.new(p.to_hash).permit(:orden, :tipo, :importe, :fecha, :estatus, :factura,:mes,:anio,:app_id,:sucursal_id,:group_id,:sucursal_tipo,:asesor_id,:key)
   end
  end
end