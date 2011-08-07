module Admin
  class TheaterShowsController < Admin::BaseController

    crudify :theater_show,
            :title_attribute => 'title_fi', :xhr_paging => true

  end
end
