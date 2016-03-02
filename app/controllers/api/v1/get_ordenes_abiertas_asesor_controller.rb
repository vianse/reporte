class Api::V1::GetOrdenesAbiertasAsesorController <ApplicationController
	def index
		@parametro = params[:app_id]
		@parametro1 = params[:id]
		asesores = Asesor.where(:user_id => current_user.id).pluck(:asesor_id).first
		@catalogo = Pendiente.where(:app_id => @parametro).where(:asesor_id => asesores).count
		render json:  @catalogo
	end
end