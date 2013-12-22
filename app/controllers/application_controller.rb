class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def import_new_customers
    customers = ShopifyAPI::Customer.all
    customers.each do |customer|
      existing_customer = User.find_by(customer_id: customer.id)
      if(!existing_customer)
          user = User.create(first_name: customer.first_name, last_name: customer.last_name, email: customer.email, customer_id: customer.id)
        end
    end
  end

  def import_new_products
    products = ShopifyAPI::Product.all
    products.each do |product|
      product.attributes[:variants].each do |variant|
        existing_product = Product.find_by(variant_id: variant.id)
        if(!existing_product)
          if(variant.inventory_management == 'shopify') 
            track_inventory = true
          else
            track_inventory = false
          end
          new_product = Product.create(title: product.title + ' ' + variant.title, variant_id: variant.id, price: variant.price, track_quantity: track_inventory, quantity: variant.inventory_quantity, image_url: product.images[0].src)
        end
      end
    end
  end
end
