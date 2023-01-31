class UserReceiptsController < ApplicationController
  before_action :set_user_receipt, only: %i[ show edit update destroy ]

  # GET /user_receipts or /user_receipts.json
  def index
    @user_receipts = UserReceipt.all
  end

  # GET /user_receipts/1 or /user_receipts/1.json
  def show
  end

  # GET /user_receipts/new
  def new
    @user_receipt = UserReceipt.new
  end

  # GET /user_receipts/1/edit
  def edit
  end

  # POST /user_receipts or /user_receipts.json
  def create
    @user_receipt = UserReceipt.new(user_receipt_params)

    respond_to do |format|
      if @user_receipt.save
        format.html { redirect_to user_receipt_url(@user_receipt), notice: "User receipt was successfully created." }
        format.json { render :show, status: :created, location: @user_receipt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_receipts/1 or /user_receipts/1.json
  def update
    respond_to do |format|
      if @user_receipt.update(user_receipt_params)
        format.html { redirect_to user_receipt_url(@user_receipt), notice: "User receipt was successfully updated." }
        format.json { render :show, status: :ok, location: @user_receipt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_receipts/1 or /user_receipts/1.json
  def destroy
    @user_receipt.destroy

    respond_to do |format|
      format.html { redirect_to user_receipts_url, notice: "User receipt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_receipt
      @user_receipt = UserReceipt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_receipt_params
      params.require(:user_receipt).permit(:name, :phone, :address, :total)
    end
end
