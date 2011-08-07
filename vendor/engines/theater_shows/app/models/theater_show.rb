class TheaterShow < ActiveRecord::Base

  acts_as_indexed :fields => [:title_fi, :title_en, :description_fi, :description_en]

  validates :title_fi, :presence => true, :uniqueness => true
  
end
