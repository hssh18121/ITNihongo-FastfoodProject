class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(account: params[:session][:account].downcase)
    
    
    respond_to do |format|
        if user && user.authenticate(params[:session][:password])
           session[:user_id] = user.id
            if user.admin == false 
                format.html { redirect_to products_url, notice: "Loggin in as user" }
            else 
               format.html { redirect_to manage_products_url, notice: "Loggin in as admin" }
            end
        else 
            format.html { redirect_to login_url, notice: "Invalid Input" }
        end
    end 
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to login_path, status: :see_other
    session[:cart] = nil
  end

end
