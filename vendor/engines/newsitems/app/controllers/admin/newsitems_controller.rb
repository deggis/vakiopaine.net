module Admin
  class NewsitemsController < Admin::BaseController

    crudify :newsitem,
            :title_attribute => 'title_fi', :xhr_paging => true

  end
end
