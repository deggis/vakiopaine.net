require 'spec_helper'

describe GuestbookNote do

  def reset_guestbook_note(options = {})
    @valid_attributes = {
      :id => 1,
      :writer_name => "RSpec is great for testing too"
    }

    @guestbook_note.destroy! if @guestbook_note
    @guestbook_note = GuestbookNote.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_guestbook_note
  end

  context "validations" do
    
    it "rejects empty writer_name" do
      GuestbookNote.new(@valid_attributes.merge(:writer_name => "")).should_not be_valid
    end

    it "rejects non unique writer_name" do
      # as one gets created before each spec by reset_guestbook_note
      GuestbookNote.new(@valid_attributes).should_not be_valid
    end
    
  end

end