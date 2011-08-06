class Event < ActiveRecord::Base

  acts_as_indexed :fields => [:title_fi, :desc_fi, :title_en, :desc_en]

  validates :title_fi, :presence => true, :uniqueness => true
  
end
