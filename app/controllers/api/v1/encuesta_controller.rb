class Api::V1::EncuestaController <ApplicationController
	include ActionView::Helpers::NumberHelper
	def index
	   telefonos = ["+5215548225097"]
       telefonos.map do |t|
        #logger.debug t
        phone_number = t
         SinchSms.send('1689b905-8427-4d27-88cb-20b6f3e7d746', '2+dPC6wLU0Ko7RPTeVT85w==', "Pronostic, gracias por usar nuestra herramienta https://pronostic.com.mx/encuesta", phone_number)
      end
      render json: {:message => "Encuesta enviada correctamente"}
	end
end
