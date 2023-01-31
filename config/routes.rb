Rails.application.routes.draw do
  resources :user_receipts
  resources :favourite_managers
  resources :product_checkout_details
  resources :receipts
  resources :users
  resources :categories
  resources :products
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get "checkout/:id", to: "products#new_checkout", as: "new_checkout"
  get "cart", to: 'products#cart'
  post "checkout", to: "products#checkout"
  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
  post "product_checkout_details/add_quantity/:id", to: "products#add_quantity", as: "add_quantity"
  post "product_checkout_details/subtract_quantity/:id", to: "products#subtract_quantity", as: "subtract_quantity"
  delete "product_checkout_details/remove_product_in_cart/:id", to: "products#remove_product_in_cart", as: "remove_product_in_cart"
  get "search", to: "products#search"
  get "sort", to: "products#sort"
  get "favourites", to: 'products#favourites'
  post "products/add_to_favourite/:id", to: "products#add_to_favourite", as: "add_to_favourite"
  delete "products/remove_from_favourite/:id", to: "products#remove_from_favourite", as: "remove_from_favourite"
  post "products/add_to_favourite2/:id", to: "products#add_to_favourite2", as: "add_to_favourite2"
  delete "products/remove_from_favourite2/:id", to: "products#remove_from_favourite2", as: "remove_from_favourite2"
  post "update_profile/:id", to: 'users#update_profile'
  get "register", to: 'users#new'
  post 'register', to: 'users#create_user'
  get "change_password", to: 'users#change_password'
  post "change_password", to: 'users#save_change_password'
end
