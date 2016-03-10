class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_sistema! , :except => [:index]
  #before_action :authenticate_super! , :except => [:index,:new]

  # GET /apps
  # GET /apps.json
  def index
    @apps = App.where(:user_id => current_super.id).where(:group_id => params[:group_id])
    @app  = App.where(:user_id => current_super.id).where(:group_id => params[:group_id]).count
    
  end

  def index_sistemas
    acceso= Appadmin.where(:admin_id => current_sistema.id).pluck(:app_id)
    @grupo= Appadmin.where(:admin_id => current_sistema.id).pluck(:group_id).first
    @grupo_name = Group.where(:group_id => @grupo).pluck(:name).first
    @apps = App.where(:api_key => acceso)
    @app  = App.where(:user_id => current_sistema.id).where(:group_id => @grupo).count
    
  end

  # GET /apps/1
  # GET /apps/1.json
  def show
  end

  # GET /apps/new
  def new
    @app = App.new
  end

  # GET /apps/1/edit
  def edit
  end

  # POST /apps
  # POST /apps.json
  def create
    @app = App.new({
      :name => params[:name],
      :api_key => params[:api_key],
      :group_id => params[:group_id],
      :type_app => params[:type_app], 
      :subgroup_id => params[:subgroup_id], 
      :user_id => params[:user_id]

})

    respond_to do |format|
      if @app.save
        format.html { redirect_to '/agencias?group_id=' + params[:group_id], notice: 'App was successfully created.' }
        format.json { render :show, status: :created, location: @app }
      else
        format.html { render :new }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apps/1
  # PATCH/PUT /apps/1.json
  def update
    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
        format.json { render :show, status: :ok, location: @app }
      else
        format.html { render :edit }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    @app.destroy
    respond_to do |format|
      format.html { redirect_to apps_url, notice: 'App was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = App.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(:name, :api_key,:group_id,:type_app, :subgroup_id, :user_id)
    end
end
