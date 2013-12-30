class SearchController < ApplicationController
  def index
  	@query = params['q']
  	@products = Product.search_for @query
  end
end
