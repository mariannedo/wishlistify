class HomeController < ApplicationController
  def index
  	@products = ShopifyAPI::Product.all

  	import_new_customers
  	import_new_products
  end
end