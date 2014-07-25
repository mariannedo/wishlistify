class HomeController < ApplicationController
	def index
		@products = ShopifyAPI::Product.all
		import_new_customers
		import_new_products
		update_product_inventory
		#redirect_to 'http://outdoor-apparel.myshopify.com/account/login?wishlist'

		create_new_orders
	end
end