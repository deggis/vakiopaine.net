::Refinery::Application.routes.draw do
  resources :theater_shows, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :theater_shows, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
