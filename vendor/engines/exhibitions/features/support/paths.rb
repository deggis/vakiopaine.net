module NavigationHelpers
  module Refinery
    module Exhibitions
      def path_to(page_name)
        case page_name
        when /the list of exhibitions/
          admin_exhibitions_path

         when /the new exhibition form/
          new_admin_exhibition_path
        else
          nil
        end
      end
    end
  end
end
