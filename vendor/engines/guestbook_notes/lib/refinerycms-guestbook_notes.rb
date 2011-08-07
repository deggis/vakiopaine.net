require 'refinerycms-base'

module Refinery
  module GuestbookNotes
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "guestbook_notes"
          plugin.activity = {
            :class => GuestbookNote,
            :title => 'writer_name'
          }
        end
      end
    end
  end
end
