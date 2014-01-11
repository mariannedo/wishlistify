class UsersController < ApplicationController
  def index
    redirect_to '/'
  end
  def new
    @user = User.new customer_id: params[:id]
  end

  def create
    @user = User.new customer_id: params[:id]
    customer = ShopifyAPI::Customer.find(params[:id])
    @user.update(first_name: customer.first_name, last_name: customer.last_name, email: customer.email)

    if @user.save
      redirect_to '/wishlist/' + params[:id]
    else
      redirect_to '/'
    end
  end

  def show
    update_product_inventory
  	@user = User.find_by customer_id: params[:id]
    if(@user) 
      @user_products = UsersProduct.where(:user_id => params[:id]).all
      check_orders
    else
      create
    end
  end

  def update 

  end

  def check_orders
    @customer = ShopifyAPI::Customer.find(params[:id])
    @orders = @customer.orders
  end
end
