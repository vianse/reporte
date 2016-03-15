class Api::V1::EncuestaController <ApplicationController
	include ActionView::Helpers::NumberHelper
	def index
	   #telefonos = ["+5215548225097","+5215548225088","+5214423389783","+5215543884061"]
	   telefonos = ["+5215548225097"]
     #telefonos = ["+5215531328421"]
       telefonos.map do |t|
        #logger.debug t
        #phone_number = t
        #logger.debug t
        SinchSms.send('1689b905-8427-4d27-88cb-20b6f3e7d746', '2+dPC6wLU0Ko7RPTeVT85w==', "Estimado Juan Carlos Santiago. La Orden de Servicio No OR0026097 a la que te has suscrito para obtener sus cambios, ya ha sido facturada. Atte: Pronostic", t)
      end
      render json: {:message => "Encuesta enviada correctamente"}
	end
end
