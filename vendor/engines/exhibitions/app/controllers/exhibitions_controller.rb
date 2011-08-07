class ExhibitionsController < ApplicationController

  before_filter :find_all_exhibitions
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @exhibition in the line below:
    present(@page)
  end

  def show
    @exhibition = Exhibition.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @exhibition in the line below:
    present(@page)
  end

protected

  def find_all_exhibitions
    @exhibitions = Exhibition.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/exhibitions").first
  end

end
