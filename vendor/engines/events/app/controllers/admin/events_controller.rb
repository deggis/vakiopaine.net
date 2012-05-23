module Admin
  class EventsController < Admin::BaseController

    crudify :event,
            :title_attribute => 'title_fi',
            :xhr_paging => true,
            :order => "date DESC",
            :sortable => false

  end
end
