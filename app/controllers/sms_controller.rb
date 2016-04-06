class SmsController < ApplicationController
  before_action :set_sm, only: [:show, :edit, :update, :destroy]

  # GET /sms
  # GET /sms.json
  def index
    @sms = Sm.all
  end

  # GET /sms/1
  # GET /sms/1.json
  def show
  end

  # GET /sms/new
  def new
    @sm = Sm.new
  end

  # GET /sms/1/edit
  def edit
  end

  # POST /sms
  # POST /sms.json
  def create
    @sm = Sm.new(sm_params)
 
    respond_to do |format|
      if @sm.save
     #telefonos = ["+5215548225097"]
     #  telefonos.map do |t|
        SinchSms.send('1689b905-8427-4d27-88cb-20b6f3e7d746', '2+dPC6wLU0Ko7RPTeVT85w==', @sm.mensaje, "+521" + @sm.telefono)
     # end
        format.html { redirect_to @sm, notice: 'Sm was successfully created.' }
        format.json { render :show, status: :created, location: @sm }
      else
        format.html { render :new }
        format.json { render json: @sm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sms/1
  # PATCH/PUT /sms/1.json
  def update
    respond_to do |format|
      if @sm.update(sm_params)
        format.html { redirect_to @sm, notice: 'Sm was successfully updated.' }
        format.json { render :show, status: :ok, location: @sm }
      else
        format.html { render :edit }
        format.json { render json: @sm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sms/1
  # DELETE /sms/1.json
  def destroy
    @sm.destroy
    respond_to do |format|
      format.html { redirect_to sms_url, notice: 'Sm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sm
      @sm = Sm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sm_params
      params.require(:sm).permit(:telefono, :mensaje, :url, :respuesta, :comentario, :app_id, :group_id, :user_id)
    end
end
