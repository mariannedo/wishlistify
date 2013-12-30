class Product < ActiveRecord::Base
	has_and_belongs_to_many :users

	def self.search_for (query)
		where('title LIKE :query', query: "%#{query}%")
	end
end