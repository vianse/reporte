class Api::V1::GetObjetivoRealController <ApplicationController
  include ActionView::Helpers::NumberHelper
	def index


		@mes = Date.today.month
		@parametro = params[:app_id]
		if params[:type] == "Servicio"
		@app    = App.where(:api_key => @parametro).pluck(:group_id).first
		@acceso = Acceso.where(:user_id => current_user.id).where(:group_id => @app).pluck(:group_id).first
		if @app.blank?
			render json: {
				message: "0.00"
			}
		else
			if @acceso.blank?
					@app    = App.where(:api_key => @parametro).pluck(:api_key).first
					@acceso = Acceso.where(:user_id => current_user.id).where(:app_id_s => @parametro).pluck(:app_id_s).first
					if @app.blank?
						render json: {
							message: "0.00"
						}
					else
						if @acceso.blank?
							render json: {
								:name => "0.00"
							}
						else

						   @catalogo = Catalogo.where(:mes => @mes).where(:app_id => @parametro).pluck(:objetivo_real).first
							@moneda = number_to_currency(@catalogo)
							render json:  {
								:objetivo => @moneda
							}
						end
					end

			else


				@catalogo = Catalogo.where(:mes => @mes).where(:app_id => @parametro).pluck(:objetivo_real).first
				@moneda = number_to_currency(@catalogo)
				render json:  {
					:objetivo => @moneda
				}
			end
		end

	  end

		if params[:type] == "HYP"
		@app    = App.where(:api_key => @parametro).pluck(:group_id).first
		@acceso = Acceso.where(:user_id => current_user.id).where(:group_id => @app).pluck(:group_id).first
		if @app.blank?
			render json: {
				message: "0.00"
			}
		else
			if @acceso.blank?
					@app    = App.where(:api_key => @parametro).pluck(:api_key).first
					@acceso = Acceso.where(:user_id => current_user.id).where(:app_id_h => @parametro).pluck(:app_id_h).first
					if @app.blank?
						render json: {
							message: "0.00"
						}
					else
						if @acceso.blank?
							render json: {
								:name => "0.00"
							}
						else

						  @catalogo = Catalogo.where(:mes => @mes).where(:app_id => @parametro).pluck(:objetivo_real).first
							@moneda = number_to_currency(@catalogo)
							render json:  {
								:objetivo => @moneda
							}
						end
					end

			else
				@catalogo = Catalogo.where(:mes => @mes).where(:app_id => @parametro).pluck(:objetivo_real).first
				@moneda = number_to_currency(@catalogo)
				render json:  {
					:objetivo => @moneda
				}

			end
		end

	  end



		# @mes = Date.today.month
		# @parametro = params[:app_id]
		# @app    = App.where(:api_key => @parametro).pluck(:api_key).first
		# @acceso = Acceso.where(:user_id => current_user.id).where(:app_id => @parametro).pluck(:app_id).first
		# if @app.blank?
		# 	render json: {
		# 		message: "El App Id no existe, favor de intentar nuevamente."
		# 	}
		# else
		# 	if @acceso.blank?
		# 		render json: {
		# 			:objetivo => "0.00"
		# 		}
		# 	else

		# 	@catalogo = Catalogo.select("objetivo_real").where(:mes => @mes).where(:app_id => @acceso)
		# 	@moneda = number_to_currency(@catalogo[0].objetivo_real)
		# 	render json:  {
		# 		:objetivo => @moneda
		# 	}
		# 	end
		# end

		# @parametro = params[:app_id]
		
		# @app = App.select("api_key").where(:user_id => current_user.id)
		# @acceso = Acceso.select("app_id").where(:user_id => current_user.id)
		# if @acceso.blank?
		# 	render json: {
		# 		:objetivo => "0.00"
		# 	}
		# else
		# 	@catalogo = Catalogo.select("objetivo_real").where(:mes => @mes).where(:app_id => @parametro)
		# 	@moneda = number_to_currency(@catalogo[0].objetivo_real)
		# 	render json:  {
		# 		:objetivo => @moneda
		# 	}
		# end
	end
	
end