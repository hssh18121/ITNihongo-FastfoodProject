class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :load_cart
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if not logged_in?
      flash[:danger] = "you must be logged in to perform that action"
      redirect_to login_path, status: :see_other
    end
  end

  def require_admin
    if not current_user.admin?
      flash[:danger] = "you must be logged in to perform that action"
      redirect_to products_path, status: :see_other
    end
  end
  private

  def initialize_session
    session[:cart] ||= [] # empty cart = empty array
  end

  def load_cart
    # @cart = Product.find(session[:cart])
    # Product.all.pluck(:id) => 1, 2
    # Product.find(1, 2, 3) => error
    # Product.where(id: [1, 2, 3]) => 1, 2
    @cart = Product.where(id: session[:cart])
  end
end
