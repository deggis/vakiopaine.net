module Admin
  class ExhibitionsController < Admin::BaseController

    crudify :exhibition,
            :title_attribute => 'title_fi', :xhr_paging => true

  end
end
