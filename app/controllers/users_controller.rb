class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_user, except: [:new, :create, :show, :index, :create_user, :new_user]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create_user
    @user = User.new
    @user.account = params[:account]
    @user.name = params[:name]
    @user.email = params[:email]
    @user.phone = params[:phone]
    @user.password = params[:password]
    @user.admin = false
    @user.save
    redirect_to login_path
  end

  def new_user
    @user = User.new

  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def update_profile
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.phone = params[:phone]
    @user.save
     respond_to do |format|
        format.html { redirect_to products_path, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
     end
  end

  def change_password
  end

  def save_change_password
    if current_user.authenticate(params[:old_password]) != false
      if params[:new_password] == params[:new_password_confirmation]
        user = User.find_by(id: current_user.id)
        user.password = params[:new_password]
        user.save!
        flash[:notice] = "Changed password successfully"
        redirect_to products_path
      else
        flash[:notice] = "New password and password confirmation not match"
        render 'change_password'
      end
    else
      flash[:notice] = "Password incorrect!"
      render 'change_password'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:account, :name, :email, :phone, :password)
    end

    def require_same_user
      if current_user != @user
        flash[:danger] = "You can only edit or delete your own information"
        redirect_to users_path
      end
    end
end
