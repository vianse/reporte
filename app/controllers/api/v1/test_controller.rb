class Api::V1::TestController <ApplicationController
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
 Facturada.delete_all(:app_id => params[:app_id]).where(:mes => @mes).where(:año => @año)
 #@crear_ordenes = Facturada.create(facturas_params)
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
   ActionController::Parameters.new(p.to_hash).permit(:orden, :tipo, :importe, :fecha, :estatus, :factura,:mes,:año,:app_id)
   end
  end
end