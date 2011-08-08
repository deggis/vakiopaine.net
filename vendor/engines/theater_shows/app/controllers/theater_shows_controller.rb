class TheaterShowsController < ApplicationController

  before_filter :find_upcoming_theater_shows
  before_filter :find_past_theater_shows
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @theater_show in the line below:
    present(@page)
  end

  def all
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

  def find_upcoming_theater_shows
    @upcoming_theater_shows = TheaterShow.find(:all, :conditions => ["ends > ?", 1.days.ago], :order => "starts ASC")
  end
  
  def find_past_theater_shows
    @past_theater_shows = TheaterShow.order('starts ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/theater_shows").first
  end

end
