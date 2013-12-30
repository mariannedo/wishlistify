class UsersController < ApplicationController
  def index
  end
  def new
    @user = User.new
  end
  def create
  end
  def show
  	@user = User.find params[:id]
    @user_products = UsersProduct.where(:user_id => params[:id]).all
  end
end
