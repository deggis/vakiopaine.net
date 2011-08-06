::Refinery::Application.routes.draw do
  resources :newsitems, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :newsitems, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
