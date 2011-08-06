require 'spec_helper'

describe Event do

  def reset_event(options = {})
    @valid_attributes = {
      :id => 1,
      :title_fi => "RSpec is great for testing too"
    }

    @event.destroy! if @event
    @event = Event.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_event
  end

  context "validations" do
    
    it "rejects empty title_fi" do
      Event.new(@valid_attributes.merge(:title_fi => "")).should_not be_valid
    end

    it "rejects non unique title_fi" do
      # as one gets created before each spec by reset_event
      Event.new(@valid_attributes).should_not be_valid
    end
    
  end

end