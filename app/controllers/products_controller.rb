class ProductsController < ApplicationController
  def index

  end
  def show 
  	update_product_inventory
  	@customer_id = params[:cid]
	@added_product = Product.where(:variant_id => params[:id]).first
	check_for_product
  end
  def check_for_product
  	@user_wishes = UsersProduct.where(:user_id => params[:cid]).all

  	if @user_wishes.size > 0 
  		@found_product = false

	  	@user_wishes.each_with_index do |w, index|
	  		if(params[:id].to_i == w.product_id.to_i)
	  			@found_product = true
	  		end
			if index == @user_wishes.size - 1 
				if @found_product == false
					add_product
			  	else
			  		flash[:notice] = @added_product.title + " is already on your wishlist."
			  		redirect_to '/wishlist/' + params[:cid]
			  	end
			end
	  	end
	else 
		add_product
	end
  end

  def add_product
  	@new_wish = UsersProduct.create(product_id: params[:id], user_id: params[:cid])
  end
end
