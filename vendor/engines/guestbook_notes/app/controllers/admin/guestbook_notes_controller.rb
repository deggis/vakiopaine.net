module Admin
  class GuestbookNotesController < Admin::BaseController

    crudify :guestbook_note,
            :title_attribute => 'writer_name', :xhr_paging => true

  end
end
