class ProductCheckoutDetailsController < ApplicationController
  before_action :set_product_checkout_detail, only: %i[ show edit update destroy ]

  # GET /product_checkout_details or /product_checkout_details.json
  def index
    @product_checkout_details = ProductCheckoutDetail.all
  end

  # GET /product_checkout_details/1 or /product_checkout_details/1.json
  def show
  end

  # GET /product_checkout_details/new
  def new
    @product_checkout_detail = ProductCheckoutDetail.new

  end

  # GET /product_checkout_details/1/edit
  def edit
  end

  # POST /product_checkout_details or /product_checkout_details.json
  def create
    @product_checkout_detail = ProductCheckoutDetail.new(product_checkout_detail_params)

    respond_to do |format|
      if @product_checkout_detail.save
        format.html { redirect_to product_checkout_detail_url(@product_checkout_detail), notice: "Product checkout detail was successfully created." }
        format.json { render :show, status: :created, location: @product_checkout_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_checkout_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_checkout_details/1 or /product_checkout_details/1.json
  def update
    respond_to do |format|
      if @product_checkout_detail.update(product_checkout_detail_params)
        format.html { redirect_to product_checkout_detail_url(@product_checkout_detail), notice: "Product checkout detail was successfully updated." }
        format.json { render :show, status: :ok, location: @product_checkout_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_checkout_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_checkout_details/1 or /product_checkout_details/1.json
  def destroy
    @product_checkout_detail.destroy

    respond_to do |format|
      format.html { redirect_to product_checkout_details_url, notice: "Product checkout detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_checkout_detail
      @product_checkout_detail = ProductCheckoutDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_checkout_detail_params
      params.require(:product_checkout_detail).permit(:name, :price, :quantity)
    end
end
