class HomeController < ApplicationController
	before_action :authenticate_user!
  def index
  	 @app = App.select("api_key").where(:user_id => current_user.id)
	 @pago = Payment.where(:app_id => @app).pluck(:estatus).first
	 
  if @pago == 1
  			redirect_to "/pago"
  	 else
  	 end
  end
end
