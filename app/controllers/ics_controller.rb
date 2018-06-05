class IcsController < ApplicationController
  before_action :set_ic, only: [:show, :edit, :update, :destroy]
  
  # GET /ics
  # GET /ics.json
  def index
    @ics = Ic.all
  end

  # GET /ics/1
  # GET /ics/1.json
  def show
     @favorite = current_user.favorites.find_by(ic_id: @ic.id)
  end

  def new
    if params[:back]
      @ic = Ic.new(ic_params)
    else
      @ic = Ic.new
    end
  end

   def confirm
     @ic = current_user.ics.new(ic_params)
     render :new if @ic.invalid?
   end

  def edit
  end

  # POST /ics
  # POST /ics.json
  
  def create
    @ic = Ic.new(ic_params)
    @ic.user_id = current_user.id
    @ic.image.retrieve_from_cache!params[:cache][:image]
    respond_to do |format|
      if @ic.save
        IcMailer.ic_mail(@ic).deliver
        format.html { redirect_to @ic, notice: 'Ic was successfully created.' }
        format.json { render :show, status: :created, location: @ic }
      else
        format.html { render :new }
        format.json { render json: @ic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ics/1
  # PATCH/PUT /ics/1.json
  def update
    respond_to do |format|
      if @ic.update(ic_params)
        format.html { redirect_to @ic, notice: 'Ic was successfully updated.' }
        format.json { render :show, status: :ok, location: @ic }
      else
        format.html { render :edit }
        format.json { render json: @ic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ics/1
  # DELETE /ics/1.json
  def destroy
    @ic.destroy
    respond_to do |format|
      format.html { redirect_to ics_url, notice: 'Ic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_ic
      @ic = Ic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ic_params
      params.require(:ic).permit(:image, :content, :user_id, :image_cache, :cache)
    end
end
