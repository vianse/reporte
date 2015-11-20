class AlertpaymentController < ApplicationController
  def index
  	def index
  	 @app = App.select("api_key").where(:user_id => current_user.id)
	 @pago = Payment.where(:app_id => @app).pluck(:estatus).first
	 
  if @pago == 0
  			redirect_to "/"
  	 else
  	 end
  end
  end
end
