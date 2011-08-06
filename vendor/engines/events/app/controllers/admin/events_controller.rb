module Admin
  class EventsController < Admin::BaseController

    crudify :event,
            :title_attribute => 'title_fi', :xhr_paging => true

  end
end
