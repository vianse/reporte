class AdminuserController < ApplicationController
    skip_before_action :verify_authenticity_token

   def index
   	@usuarios = Sistema.where(:group_id => params[:group_id])
    @usuario = Sistema.where(:group_id => params[:group_id]).count
   end


  def create
      @verifica = Sistema.existe(params[:email]).count
        if @verifica == 1 
          render json: { :mensaje => "El correo " + params[:email] + " ya existe, intente con otro correo"}
        else  
          user = Sistema.new(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation], :group_id => params[:group_id], :app_id => params[:app_id])
          if user.save	
             redirect_to '/administracion'
            else
          end
        end   
 	end

  def destroy
    @user = Sistema.find(params[:id])
    if @user.destroy
        redirect_to root_url, notice: "Administrador Eliminado."
    end
  end
end

