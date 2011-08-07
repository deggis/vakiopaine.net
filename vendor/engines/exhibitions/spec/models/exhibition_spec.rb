require 'spec_helper'

describe Exhibition do

  def reset_exhibition(options = {})
    @valid_attributes = {
      :id => 1,
      :title_fi => "RSpec is great for testing too"
    }

    @exhibition.destroy! if @exhibition
    @exhibition = Exhibition.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_exhibition
  end

  context "validations" do
    
    it "rejects empty title_fi" do
      Exhibition.new(@valid_attributes.merge(:title_fi => "")).should_not be_valid
    end

    it "rejects non unique title_fi" do
      # as one gets created before each spec by reset_exhibition
      Exhibition.new(@valid_attributes).should_not be_valid
    end
    
  end

end