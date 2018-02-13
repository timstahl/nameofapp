Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, controllers: { registrations: "user_registrations" }
  resources :users
  resources :products do
  resources :comments
  end
  resources :orders, only: [:index, :show, :create, :destroy]

  mount ActionCable.server => '/cable'
  

  root 'static_pages#landing_page', as: 'intro'

  get 'static_pages/contact', to: 'static_pages#contact', as: 'contact'

  #root 'static_pages#landing_page' #old root page

  get '/home', to: 'static_pages#landing_page', as: 'home'

  get 'static_pages/about', to: 'static_pages#about', as: 'about'

  get 'static_pages/index', to: 'static_pages#landing_page', as: 'landing_page'

  post 'static_pages/thank_you'

  post '/payments/create'

  get 'payments/create', to: 'payments#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
