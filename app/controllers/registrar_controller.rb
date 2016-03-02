class RegistrarController < ApplicationController
	 include ActionView::Helpers::NumberHelper
    skip_before_action :verify_authenticity_token

   def index
   	@usuarios = User.where(:group_id => params[:group_id])
    @usuario = User.where(:group_id => params[:group_id]).count
   end

  def create
      @verifica = User.existe(params[:email]).count
        if @verifica == 1 
          render json: { :mensaje => "El correo " + params[:email] + " ya existe, intente con otro correo"}
        else  
          user = User.new(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation], :group_id => params[:group_id], :sistemas_id => current_sistema.id)
          if user.save	
             redirect_to '/panel'
            else
          end
        end   
 	end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
        redirect_to root_url, notice: "User deleted."
    end
  end
end
