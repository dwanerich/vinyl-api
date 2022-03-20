class VinylsController < ApplicationController
  before_action :set_vinyl, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /vinyls or /vinyls.json
  def index
    @vinyls = Vinyl.all
  end

  # GET /vinyls/1 or /vinyls/1.json
  def show
  end

  # GET /vinyls/new
  def new
    # @vinyl = Vinyl.new
    @vinyl = current_user.vinyls.build
  end

  # GET /vinyls/1/edit
  def edit
  end

  # POST /vinyls or /vinyls.json
  def create
    # @vinyl = Vinyl.new(vinyl_params)
    @vinyl = current_user.vinyls.build(vinyl_params)

    respond_to do |format|
      if @vinyl.save
        format.html { redirect_to vinyl_url(@vinyl), notice: "Vinyl was successfully created." }
        format.json { render :show, status: :created, location: @vinyl }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vinyl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vinyls/1 or /vinyls/1.json
  def update
    respond_to do |format|
      if @vinyl.update(vinyl_params)
        format.html { redirect_to vinyl_url(@vinyl), notice: "Vinyl was successfully updated." }
        format.json { render :show, status: :ok, location: @vinyl }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vinyl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vinyls/1 or /vinyls/1.json
  def destroy
    @vinyl.destroy

    respond_to do |format|
      format.html { redirect_to vinyls_url, notice: "Vinyl was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Correction User
  def correct_user
    @vinyl = current_user.vinyls.find_by(id: params[:id])
    redirect_to vinyls_path, notice: "Not Authorized to Edit This Vinyl" if @vinyl.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vinyl
      @vinyl = Vinyl.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vinyl_params
      params.require(:vinyl).permit(:artist, :title, :genre, :year, :user_id)
    end
end
