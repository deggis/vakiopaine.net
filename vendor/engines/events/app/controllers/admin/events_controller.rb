module Admin
  class EventsController < Admin::BaseController

    crudify :event,
            :title_attribute => 'title_fi',
            :xhr_paging => true,
            :order => "created_at DESC",
            :sortable => false

  end
end
