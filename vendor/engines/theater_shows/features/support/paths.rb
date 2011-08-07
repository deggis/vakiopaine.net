module NavigationHelpers
  module Refinery
    module TheaterShows
      def path_to(page_name)
        case page_name
        when /the list of theater_shows/
          admin_theater_shows_path

         when /the new theater_show form/
          new_admin_theater_show_path
        else
          nil
        end
      end
    end
  end
end
