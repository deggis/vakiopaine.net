class EventsController < ApplicationController

  before_filter :find_all_events
  before_filter :find_page
  before_filter :find_upcoming_events

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event in the line below:
    present(@page)
  end

  def all
    present(@page)
  end

  def show
    @event = Event.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event in the line below:
    present(@page)
  end

protected

  def find_all_events
    @all_events = Event.order('date ASC')
  end

  def find_upcoming_events
    @upcoming_events = Event.find(:all, :conditions => ["date > ?", 1.days.ago], :order => "date ASC")
  end

  def find_page
    @page = Page.where(:link_url => "/events").first
  end

end
