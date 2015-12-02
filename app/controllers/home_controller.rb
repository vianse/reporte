class HomeController < ApplicationController
	before_action :authenticate_user!
  def index
   @mes = Date.today.month
   @año = Date.today.year
   @parametro = params[:app_id]
   @objetivo = Catalogo.where(:app_id => @parametro).where(:mes => @mes).where(:año => @año).first

   @tipo = params[:type]
   #@app = App.select("api_key").where(:user_id => current_user.id)
	 @pago = Payment.where(:app_id => @parametro).pluck(:estatus).last
   #valida si es grupo
	 @grupo = Acceso.select("group_id").where(:user_id => current_user.id).pluck(:group_id).first
    if @grupo.blank?
          #valida si es agencia
            @agencia = Acceso.select("app_id_s").where(:user_id => current_user.id).pluck(:app_id_s).first
            if @agencia.blank?
              @apps = App.where(:api_key => @agencia).count
            else
              @apps = App.where(:api_key => @agencia).count
              #render json: "Subgrupo #{@apps}"
            end
        
    else
      @apps = App.where(:group => @grupo).count
      #redirect_to "/general?group_id=" + @grupo
      #render json: "grupo #{@apps}" 

    end
   
  if @pago.to_i == 1
  			redirect_to "/pago"
  	 else
  	 end
  end
  def index_hyp
  @parametro = params[:app_id]
  @ordenes = Pendiente.where(:sucursal_id => "53616251380") 

   @tipo = params[:type]
   #@app = App.select("api_key").where(:user_id => current_user.id)
   @pago = Payment.where(:app_id => @parametro).pluck(:estatus).first
   #valida si es grupo
   @grupo = Acceso.select("group_id").where(:user_id => current_user.id).pluck(:group_id).first
    if @grupo.blank?
          #valida si es agencia
            @agencia = Acceso.select("app_id_s").where(:user_id => current_user.id).pluck(:app_id_s).first
            if @agencia.blank?
              @apps = App.where(:api_key => @agencia).count
            else
              @apps = App.where(:api_key => @agencia).count
              #render json: "Subgrupo #{@apps}"
            end
        
    else
      @apps = App.where(:group => @grupo).count
      #render json: "grupo #{@apps}"
    end
   
  if @pago == 1
        redirect_to "/pago"
     else
     end
  end
  def index_general

  @parametro = params[:app_id]
  #@ordenes = Pendiente.where(:sucursal_id => "53616251380") 

   @tipo = params[:type]
   #@app = App.select("api_key").where(:user_id => current_user.id)
    @pago = Payment.where(:app_id => @parametro).pluck(:estatus).first
   #valida si es grupo
   @grupo = Acceso.select("group_id").where(:user_id => current_user.id).pluck(:group_id).first
    if @grupo.blank?
          #valida si es agencia
            @agencia = Acceso.select("app_id_s").where(:user_id => current_user.id).pluck(:app_id_s).first
            if @agencia.blank?
              @apps = App.where(:api_key => @agencia).count
            else
              @apps = App.where(:api_key => @agencia).count
              #render json: "Subgrupo #{@apps}"
            end
        
    else
      @apps = App.where(:group => @grupo).count
      #render json: "grupo #{@apps}"

    end
   
  if @pago == 1
        redirect_to "/pago"
     else
     end
  end

  
end
