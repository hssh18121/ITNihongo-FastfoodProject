class ProductsController < ApplicationController

  before_action :require_user, except: [:favourites, :show, :index, :search, :filter]
  before_action :require_admin, except: [:cart, :favourites, :search, :sort, :show, :index, :add_to_cart, :remove_from_cart, :checkout, :new_checkout, :add_quantity, :subtract_quantity,
  :add_to_favourite, :remove_from_favourite, :add_to_favourite2, :remove_from_favourite2, :remove_product_in_cart]

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to products_path
    @product_checkout_detail = ProductCheckoutDetail.new
    @product_checkout_detail.name = Product.find(id).name
    @product_checkout_detail.price = Product.find(id).price
    @product_checkout_detail.quantity = 1
    @product_checkout_detail.save
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    @product_checkout_detail = ProductCheckoutDetail.find_by(name: Product.find(id).name)
    if @product_checkout_detail.present?
      @product_checkout_detail.destroy
    end
    redirect_to products_path
  end

  def cart
    @product_checkout_details = ProductCheckoutDetail.all
   
  end
    
    
    def show_checkout_form 
    end
    
    def manage_account 
    end
    
  def add_quantity
    id = params[:id].to_i
    @product_checkout_detail = ProductCheckoutDetail.find_by(id: id)
    @product_checkout_detail.quantity += 1
    @product_checkout_detail.save
    redirect_to cart_path
  end

  def subtract_quantity
    id = params[:id].to_i
    @product_checkout_detail = ProductCheckoutDetail.find_by(id: id)
    if(@product_checkout_detail.quantity >= 1)
      @product_checkout_detail.quantity -= 1
    end
    @product_checkout_detail.save
    redirect_to cart_path
  end

  def remove_product_in_cart
    id = params[:id].to_i
    cart_id = Product.find_by(name: ProductCheckoutDetail.find_by(id: id).name).id
    session[:cart].delete(cart_id)
    @product_checkout_detail = ProductCheckoutDetail.find_by(id: id)
    @product_checkout_detail.destroy
    redirect_to cart_path
  end

  $product_checkout_details
  def checkout
    @user_receipt = UserReceipt.new
      @product_checkout_details = ProductCheckoutDetail.all
      $product_checkout_details = ProductCheckoutDetail.all.clone
      total = 0
    if @product_checkout_details.present?
      @product_checkout_details.each do |product_checkout_detail|
        product_checkout_detail.save
        total = product_checkout_detail.price * product_checkout_detail.quantity + total
      end


    end
    @user_receipt.name = params[:name]
    @user_receipt.phone = params[:phone]
    @user_receipt.address = params[:address]
    @user_receipt.total = total
    @user_receipt.user_id = current_user.id
    @user_receipt.save
    session[:cart] = nil
    # redirect_to "http://localhost:3000/checkout/#{@user_receipt.id}"
    redirect_to :action=> "new_checkout", :id => (@user_receipt.id)
  end

  def new_checkout
    id = params[:id].to_i
    @user_receipt = UserReceipt.find_by(id: id)
    @product_checkout_details = ProductCheckoutDetail.all

    @r = Receipts::Receipt.new(

      details: [
        ["Receipt Number", "123"],
        ["Date paid", Date.today],
        ["Payment method", "Cash"]
      ],
      company: {
        name: "Fastfood",
        address: "So 1 Dai Co Viet",
        email: "Fastfood@gmail.com",

      },
      recipient: [

          @user_receipt.name,
          @user_receipt.address,
          @user_receipt.phone,
          nil,
          current_user.email

      ],

        line_items: [
          [nil, nil, nil, nil],
        ],

    )
    # @r.text("<font size='10' width='1000'>hello this is a test function</font> <font size='10'>hello this is a test function 2</font>", :inline_format => true, :single_line => true )
    # @r.text("<font size='10'>hello this is a test function 2</font>", :inline_format => true)
        @r.render_line_items([["<b>Here is your order detail:</b>"]])
    $product_checkout_details.each_with_index do |product_checkout_detail, index|


      @r.render_footer("<b>Item #{index + 1}</b>: #{product_checkout_detail.name}\nPrice: #{product_checkout_detail.price}\nQuantity: #{product_checkout_detail.quantity}\nTotal: #{product_checkout_detail.price * product_checkout_detail.quantity}")

    end
    @r.render_footer("<b>Total price: #{@user_receipt.total }</b>")
    respond_to do |format|
      format.html
      format.json
      format.pdf{send_data @r.render, disposition: :inline}
    end
    @r.render_file "receipt#{@user_receipt.id}.pdf"
    @user_receipt.file.attach(io: File.open("receipt#{@user_receipt.id}.pdf"), filename: "receipt#{@user_receipt.id}.pdf")
    @user_receipt.save
    ProductCheckoutDetail.delete_all


  end
  # GET /products or /products.json
  def index
    @products = Product.paginate(page: params[:page], per_page: 8)

    @product_checkout_details = ProductCheckoutDetail.all
  end

  def search
    @products = Product.where("name LIKE ?", "%" + params[:q] + "%")
  end

  def sort
    if params[:value].to_i == 1
      @products = Product.order(:price)
    elsif params[:value].to_i == 2
      @products = Product.order(price: :desc)
    elsif params[:value].to_i == 3
      @products = Product.where('price > 25000 AND price < 50000').order(price: :asc)
    elsif params[:value].to_i == 4
      @products = Product.where('price > 50000 AND price < 100000').order(price: :asc)
    elsif params[:value].to_i == 5
      @products = Product.where('price > 100000').order(price: :asc)
    end
  end
  # GET /products/1 or /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to manage_products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_to_favourite
    @favourite_manager = FavouriteManager.new
    @favourite_manager.user_id = current_user.id
    id = params[:id].to_i
    @favourite_manager.product_id = id
    @favourite_manager.save
    redirect_to products_path
  end

  def remove_from_favourite
    id = params[:id].to_i
    @favourite_manager = FavouriteManager.find_by(user_id: current_user.id, product_id: id)
    @favourite_manager.destroy

    redirect_to products_path
  end

  def add_to_favourite2
    @favourite_manager = FavouriteManager.new
    @favourite_manager.user_id = current_user.id
    id = params[:id].to_i
    @favourite_manager.product_id = id
    @favourite_manager.save
    redirect_to favourites_path
  end

  def remove_from_favourite2
    id = params[:id].to_i
    @favourite_manager = FavouriteManager.find_by(user_id: current_user.id, product_id: id)
    @favourite_manager.destroy

    redirect_to favourites_path
  end

  def favourites
    @favourite_managers = FavouriteManager.all
  end

  def manage_products 
      @products = Product.all
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])

    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :image, :category_id)
    end






end
