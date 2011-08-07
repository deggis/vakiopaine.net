::Refinery::Application.routes.draw do
  resources :exhibitions, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :exhibitions, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
