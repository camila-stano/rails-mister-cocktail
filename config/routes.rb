# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  root to: "cocktails#index"
  
  resources :cocktails, only: %i[index new create show edit update destroy] do 
    resources :doses, only: %i[new create edit update]
  end
  
  resources :comments, only: %i[index new create]
  resources :doses, only: %i[destroy]

  
end
