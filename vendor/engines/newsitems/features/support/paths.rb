module NavigationHelpers
  module Refinery
    module Newsitems
      def path_to(page_name)
        case page_name
        when /the list of newsitems/
          admin_newsitems_path

         when /the new newsitem form/
          new_admin_newsitem_path
        else
          nil
        end
      end
    end
  end
end
