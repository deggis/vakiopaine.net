class Exhibition < ActiveRecord::Base

  acts_as_indexed :fields => [:title_fi, :title_en, :author, :description_fi, :description_en]

  validates :title_fi, :presence => true, :uniqueness => true
  
  belongs_to :sample, :class_name => 'Image'
end
