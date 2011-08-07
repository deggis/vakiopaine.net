require 'refinerycms-base'

module Refinery
  module TheaterShows
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "theater_shows"
          plugin.activity = {
            :class => TheaterShow,
            :title => 'title_fi'
          }
        end
      end
    end
  end
end
