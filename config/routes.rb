# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  root to: "cocktails#index"
  
  resources :cocktails, only: %i[index new create show edit update destroy] do 
    resources :doses, only: %i[new create edit update]
  end

  resources :doses, only: %i[destroy]

  resources :comments, only: %i[index]
  
end
