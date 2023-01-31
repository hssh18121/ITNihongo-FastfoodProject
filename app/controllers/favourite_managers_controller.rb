class FavouriteManagersController < ApplicationController
  before_action :set_favourite_manager, only: %i[ show edit update destroy ]

  # GET /favourite_managers or /favourite_managers.json
  def index
    @favourite_managers = FavouriteManager.all
  end

  # GET /favourite_managers/1 or /favourite_managers/1.json
  def show
  end

  # GET /favourite_managers/new
  def new
    @favourite_manager = FavouriteManager.new
  end

  # GET /favourite_managers/1/edit
  def edit
  end

  # POST /favourite_managers or /favourite_managers.json
  def create
    @favourite_manager = FavouriteManager.new(favourite_manager_params)

    respond_to do |format|
      if @favourite_manager.save
        format.html { redirect_to favourite_manager_url(@favourite_manager), notice: "Favourite manager was successfully created." }
        format.json { render :show, status: :created, location: @favourite_manager }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favourite_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favourite_managers/1 or /favourite_managers/1.json
  def update
    respond_to do |format|
      if @favourite_manager.update(favourite_manager_params)
        format.html { redirect_to favourite_manager_url(@favourite_manager), notice: "Favourite manager was successfully updated." }
        format.json { render :show, status: :ok, location: @favourite_manager }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favourite_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favourite_managers/1 or /favourite_managers/1.json
  def destroy
    @favourite_manager.destroy

    respond_to do |format|
      format.html { redirect_to favourite_managers_url, notice: "Favourite manager was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourite_manager
      @favourite_manager = FavouriteManager.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favourite_manager_params
      params.require(:favourite_manager).permit(:user_id, :product_id)
    end
end
