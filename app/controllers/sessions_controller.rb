class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(account: params[:session][:account].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to products_path, status: :see_other

    else
      render 'new'
      flash[:notice] = "Something was wrong"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to login_path, status: :see_other
    session[:cart] = nil
  end

end
