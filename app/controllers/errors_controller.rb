class ErrorsController < ApplicationController
  def app_id
  end
  def acceso
  end
  def sucursal
  end
 def show
    render status_code.to_s, :status => status_code
  end
 
protected
 
  def status_code
    params[:code] || 500
  end



end
