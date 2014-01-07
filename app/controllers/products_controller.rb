class ProductsController < ApplicationController
  def index

  end
  def show 
  	@customer_id = params[:cid]
	@added_product = Product.where(:variant_id => params[:id]).all
	check_for_product
  end
  def check_for_product
  	user_wishes = UsersProduct.where(:user_id => params[:cid]).all

  	if user_wishes.size > 0 
  		@found_product = false
	  	user_wishes.each do |w, index|
	  		if w.product_id == params[:id]
	  			@found_product = true
	  		end
			if index == user_wishes.size - 1 
				if @found_product != true
					redirect_to '/'
			  	else
			  		redirect_to '/wishlist/' + params[:cid]
			  	end
			end
	  	end
	else 
		add
	end
  end

  def add
  	@new_wish = UsersProduct.create(product_id: params[:id], user_id: params[:cid])
  	redirect_to '/wishlist/' + params[:cid]
  end
end
