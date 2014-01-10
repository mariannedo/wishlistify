class HomeController < ApplicationController
	def index
		#@products = ShopifyAPI::Product.all
		#import_new_customers
		#import_new_products
		redirect_to 'http://outdoor-apparel.myshopify.com/account/login?wishlist'
	end
end