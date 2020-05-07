Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "products#index"
 
  resources :products
  
  resources :categories, param: :category_id, only: [] do
    collection do
    end
    
    member do
      get :products
      resources :subcategories, param: :subcategory_id, only: [] do
        member do
          get :products
        end
      end
    end
  end
  
  get "admin/log_in", to: "admin#log_in"
  post "admin/create_session", to: "admin#create_session"
  get "admin/log_out", to: "admin#log_out"
end