Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api , defaults: { format: :json } do
    namespace :v1 do
      resources :employees do
        member do
          put :resign
          get :reporters_hierarchy
        end
        get :highest_paid_employees, on: :collection
      end
    end
  end
end
