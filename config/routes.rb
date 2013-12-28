Sportzal::Application.routes.draw do
  mount WillFilter::Engine => "/will_filter"   

  resources :availables


 

  resources :messages


  resources :user_sports do
     collection do
      match 'search' => 'contents#search', via: [:get, :post], as: :search
     end
  end

  devise_for :users
 
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
