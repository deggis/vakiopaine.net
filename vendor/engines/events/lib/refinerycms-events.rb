require 'refinerycms-base'

module Refinery
  module Events
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "events"
          plugin.activity = {
            :class => Event,
            :title => 'title_fi'
          }
        end
      end
    end
  end
end
