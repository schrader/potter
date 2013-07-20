Potter::Application.routes.draw do
  

  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations", passwords: "users/passwords"}

  resources :invitations, only: [:index, :show] do
    collection do
      get :accept
    end 
  end

  resources :links, only: [:new, :create]
  
  resources :pots do
    resources :links, except: [:new], controller: 'pots/links'  do

      collection do
        get :archive
      end
    end
    resources :invitations, only: [:create, :new]
  end
  
  root to: "pots#index"
end
