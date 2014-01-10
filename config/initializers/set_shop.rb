shop_url = "https://" + ENV['SHOPIFY_API_KEY'] + ":" + ENV['SHOPIFY_API_PASSWORD'] + "@outdoor-apparel.myshopify.com/admin"
ShopifyAPI::Base.site = shop_url