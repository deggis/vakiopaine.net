class ExhibitionsController < ApplicationController

  before_filter :find_page
  before_filter :find_upcoming_exhibitions
  before_filter :find_past_exhibitions

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

  def find_upcoming_exhibitions
    @upcoming_exhibitions = Exhibition.find(:all, :conditions => ["ends > ?", 1.days.ago], :order => 'starts ASC')
  end

  def find_past_exhibitions
    @past_exhibitions = Exhibition.find(:all, :conditions => ["ends < ?", Time.now], :order => 'starts ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/exhibitions").first
  end

end
