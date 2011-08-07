class TheaterShowsController < ApplicationController

  before_filter :find_all_theater_shows
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @theater_show in the line below:
    present(@page)
  end

  def show
    @theater_show = TheaterShow.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @theater_show in the line below:
    present(@page)
  end

protected

  def find_all_theater_shows
    @theater_shows = TheaterShow.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/theater_shows").first
  end

end
