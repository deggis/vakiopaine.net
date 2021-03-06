::Refinery::Application.routes.draw do
  resources :newsitems, :only => [:index, :show]

  match "/newsitems/page/:page" => "newsitems#page"
  match "/uutiset/sivu/:page" => "newsitems#page"

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :newsitems, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
