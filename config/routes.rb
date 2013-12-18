Sportzal::Application.routes.draw do
  
  resources :user_availables

  

  resources :availables


  devise_for :users
  resources :availables
  resources :user_sports
  resources :sports
  
  devise_scope :user do
   get "/invite" => "devise/invitations#new"
   get "/accept" => "devise/invitations#edit"
   
  end

  devise_for :users, :controllers => { :invitations => 'users/invitations' }

  root to: 'static_pages#home'

  match '/dashboard', to: 'user_sports#index', as: "user_root"
  match '/profile/:id', to: 'user#show', as: "profile"
  match '/myprofile', to: 'user#myprofile' 
end
