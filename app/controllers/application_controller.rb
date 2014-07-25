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
          new_product = Product.create(title: product.title + ' - ' + variant.title, variant_id: variant.id, price: variant.price, track_quantity: track_inventory, quantity: variant.inventory_quantity, image_url: product.images[0].src, handle: product.handle)
        end
      end
    end
  end

  def update_product_inventory
    products = ShopifyAPI::Product.all 
    products.each do |product| 
      product.attributes[:variants].each do |variant|
        existing_product = Product.find_by(variant_id: variant.id)
        if(existing_product)
          if(variant.inventory_management == 'shopify') 
            if(existing_product.quantity != variant.inventory_quantity)
              update_product = existing_product.update(quantity: variant.inventory_quantity)
            end
          end
        end
      end
    end
  end

  def create_new_orders
    # 5 xl orange shirts
    #new_order = ShopifyAPI::Order.new({"line_items"=>[{"variant_id"=> 524806325,"quantity"=> 5 }]})
    #new_order.save

    # 3 med green shirts. fulfilled
    new_order2 = ShopifyAPI::Order.new({"email"=>"marianne.do@barrelny.com.com","fulfillment_status"=>"fulfilled","send_receipt"=>true,"send_fulfillment_receipt"=>true,"line_items"=>[{"variant_id"=> 443635021,"quantity"=> 3 }]})
    new_order2.save
  end

  def create_new_customer
    # new_customer = ShopifyAPI::Customer.new({'first_name' => 'Steve','last_name' => 'Lastnameson','email' => 'steve@email.com','addresses' => [{'address1' => '123 Oak St','city' =>'Ottawa', 'province'=>'ON', 'phone'=>'555-1212', 'zip'=>'123ABC', 'last_name'=>'Lastnameson', 'first_name'=>'Mother', 'country'=>'CA' } ], 'send_email_invite'=>true})
    # new_customer.save
  end
  
end
