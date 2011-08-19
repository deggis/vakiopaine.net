class NewsitemsController < ApplicationController

#  before_filter :find_all_newsitems
  before_filter :find_first_newsitems
  before_filter :find_page
  before_filter :find_sideimage

  def index
    page
  end

  def show
    @newsitem = Newsitem.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @newsitem in the line below:
    present(@page)
  end

  def page
    page_n = params[:page].to_i

    if !page_n
        page_n = 0
    end

    @newsitems = Newsitem.order('created_at DESC').offset(4*page_n).limit(4)
    @next_page = page_n + 1
    if page_n > 0
        @prev_page = page_n - 1
    end
    present(@page)
  end

protected

  def find_first_newsitems
    @newsitems = Newsitem.order('created_at DESC').limit(4)
  end

  def find_all_newsitems
    @newsitems = Newsitem.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/newsitems").first
  end

  def find_sideimage
    @sidebar_image_url = '/images/vas_uutiset.jpg'
  end

end
