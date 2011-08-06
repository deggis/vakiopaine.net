require 'spec_helper'

describe Newsitem do

  def reset_newsitem(options = {})
    @valid_attributes = {
      :id => 1,
      :title_fi => "RSpec is great for testing too"
    }

    @newsitem.destroy! if @newsitem
    @newsitem = Newsitem.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_newsitem
  end

  context "validations" do
    
    it "rejects empty title_fi" do
      Newsitem.new(@valid_attributes.merge(:title_fi => "")).should_not be_valid
    end

    it "rejects non unique title_fi" do
      # as one gets created before each spec by reset_newsitem
      Newsitem.new(@valid_attributes).should_not be_valid
    end
    
  end

end