# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :shopify, ENV['SHOPIFY_API_KEY'], ENV['SHOPIFY_SHARED_SECRET'],
#   			:scope => 'read_products,read_orders,write_content',
#             :setup => lambda { |env| params = Rack::Utils.parse_query(env['QUERY_STRING'])
#                                      env['omniauth.strategy'].options[:client_options][:site] = "https://outdoor-apparel.myshopify.com" }
# end