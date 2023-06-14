Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'api/search_warehouses/', to: 'pr_lg#search_warehouses', as: 'pr_lg_search_warehouses'
  get 'api/search_products/:article_number', to: 'pr_lg#search_products'
  get 'api/search_customers/:name', to: 'pr_lg#search_customers'
  get 'api/search_items/:article_number/:amount', to: 'pr_lg#search_items'
  post 'api/add_to_cart/:article_number/:warehouse_id/:count', to: 'pr_lg#add_to_cart'
  # Defines the root path route ("/")
  # root "articles#index"
end
