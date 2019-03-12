Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to:'portfolios#show', as: 'portfolio_show'
  get 'angular-items', to:'portfolios#angular'
  root to: 'pages#home'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :blogs do
    member do 
      get :toggle_status
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
