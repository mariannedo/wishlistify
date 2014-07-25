class HomeController < ApplicationController
	def index
		@products = ShopifyAPI::Product.all
		import_new_customers
		import_new_products
		update_product_inventory
		#redirect_to 'http://outdoor-apparel.myshopify.com/account/login?wishlist'


	end

	# def create_new_product
 #    	@new_product = Product.new
 #    	@new_product.line_items[0].variant_id = '11111'; 
 #    	@new_product.to_json

 #    	@new_product = 
 # 	end
end