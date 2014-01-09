class UsersProductsController < ApplicationController
  def destroy
  	@deleted_wish = UsersProduct.find(params[:id])
  	@deleted_wish.delete
  	redirect_to '/wishlist/' + params[:cid]
  end
end