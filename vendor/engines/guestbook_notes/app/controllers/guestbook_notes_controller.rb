class GuestbookNotesController < ApplicationController

  before_filter :find_all_guestbook_notes
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @guestbook_note in the line below:
    present(@page)
  end

  def show
    @guestbook_note = GuestbookNote.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @guestbook_note in the line below:
    present(@page)
  end

protected

  def find_all_guestbook_notes
    @guestbook_notes = GuestbookNote.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/guestbook_notes").first
  end

end
