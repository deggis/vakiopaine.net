::Refinery::Application.routes.draw do
  resources :guestbook_notes, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :guestbook_notes, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
