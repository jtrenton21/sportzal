Sportzal::Application.routes.draw do
  

  resources :user_sports
  resources :sports
  devise_for :users


  root to: 'static_pages#home'

  match '/dashboard', to: 'users#dashboard', as: "user_root"

  
end
