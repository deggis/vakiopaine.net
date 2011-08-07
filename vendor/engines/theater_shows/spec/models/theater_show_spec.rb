require 'spec_helper'

describe TheaterShow do

  def reset_theater_show(options = {})
    @valid_attributes = {
      :id => 1,
      :title_fi => "RSpec is great for testing too"
    }

    @theater_show.destroy! if @theater_show
    @theater_show = TheaterShow.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_theater_show
  end

  context "validations" do
    
    it "rejects empty title_fi" do
      TheaterShow.new(@valid_attributes.merge(:title_fi => "")).should_not be_valid
    end

    it "rejects non unique title_fi" do
      # as one gets created before each spec by reset_theater_show
      TheaterShow.new(@valid_attributes).should_not be_valid
    end
    
  end

end