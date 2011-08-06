class Newsitem < ActiveRecord::Base

  acts_as_indexed :fields => [:title_fi, :title_en, :desc_fi, :desc_en]

  validates :title_fi, :presence => true, :uniqueness => true
  
end
