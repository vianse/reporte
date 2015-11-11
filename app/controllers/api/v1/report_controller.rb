class Api::V1::ReportController <ApplicationController
	before_filter :restrict_access
	def index
		render json: {
			fecha: "05/10/2015",
			citas: "5",
			concesionaria: "Audi Queretaro",
			asesor: "Guillermo Peréz"
		}
	end
	private
	def restrict_access
	api_key = App.find_by_api_key(params[:access_token])
	head :unauthorized unless api_key
	end
end