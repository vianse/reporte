class Api::V1::GarantiasDetallesController <ApplicationController
    include ActionView::Helpers::NumberHelper
 def index
    @mes = Date.today.month
    @año = Date.today.year
    @verde = Garantium.where.not(:dias => nil).where(:mes => @mes).where(:app_id => params[:app_id]).where(:año => @año).where(:dias => 0..7).count
    @amarillo = Garantium.where.not(:dias => nil).where(:mes => @mes).where(:app_id => params[:app_id]).where(:año => @año).where(:dias => 8..11).count
    @rojo = Garantium.where.not(:dias => nil).where(:mes => @mes).where(:app_id => params[:app_id]).where(:año => @año).where(:dias => 12..100).count

    logger.debug @rojo
    render json:   
        
            {
                :verde => "  Número de ordenes cobradas de manera eficiente #{@verde}",
                :amarillo => "  Número de ordenes cobradas a tiempo #{@amarillo}",
                :rojo => "  Número de ordenes cobradas en el limite del tiempo #{@rojo}"
  
            }
       


 end
end