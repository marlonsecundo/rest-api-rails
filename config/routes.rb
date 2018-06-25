Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json }  do
    namespace :v1 do
      resources :survivors, :only => [:show, :update, :index, :create] do
    
        resources :locations, :only => [:update, :index] do
        end
    
        resources :inventories, :only => [:index] do
        end
    
      end
      
      resources :percentinfected, :only => [:index] do
      end
      resources :percentsurvivor, :only => [:index] do
      end
      resources :averageamout, :only => [:index] do
      end
      resources :pointslost, :only => [:index] do
      end
      resources :tradeitem, :only => [:create] do
      end
      
    end
  end
end
