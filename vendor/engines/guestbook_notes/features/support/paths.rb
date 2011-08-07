module NavigationHelpers
  module Refinery
    module GuestbookNotes
      def path_to(page_name)
        case page_name
        when /the list of guestbook_notes/
          admin_guestbook_notes_path

         when /the new guestbook_note form/
          new_admin_guestbook_note_path
        else
          nil
        end
      end
    end
  end
end
