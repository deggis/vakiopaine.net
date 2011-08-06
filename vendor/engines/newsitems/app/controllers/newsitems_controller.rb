class NewsitemsController < ApplicationController

  before_filter :find_all_newsitems
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @newsitem in the line below:
    present(@page)
  end

  def show
    @newsitem = Newsitem.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @newsitem in the line below:
    present(@page)
  end

protected

  def find_all_newsitems
    @newsitems = Newsitem.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/newsitems").first
  end

end
