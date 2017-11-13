Rails.application.routes.draw do

  resources :products

  root 'static_pages#index', as: 'intro'

  get 'static_pages/contact', to: 'static_pages#contact', as: 'contact'

  #root 'static_pages#landing_page' #old root page

  get '/home', to: 'static_pages#landing_page', as: 'home'

  get 'static_pages/about', to: 'static_pages#about', as: 'about'

  get 'static_pages/index', to: 'static_pages#landing_page', as: 'landing_page'

  post 'static_pages/thank_you'


  resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
