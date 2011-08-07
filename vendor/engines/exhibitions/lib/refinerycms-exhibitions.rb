require 'refinerycms-base'

module Refinery
  module Exhibitions
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "exhibitions"
          plugin.activity = {
            :class => Exhibition,
            :title => 'title_fi'
          }
        end
      end
    end
  end
end
