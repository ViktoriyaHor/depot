Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  recources :support_requests, only: %i[ index update ]
  resources :users
  resources :products do
    member do
      get 'who_bought'
    end
  end
  scope '(:locale)' do
    resources :orders
    resources :line_items do
      collection do
        post 'decrease'
      end
    end
    resources :carts
    root 'store#index', as: 'store_index', via: :all
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
