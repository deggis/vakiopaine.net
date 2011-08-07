class GuestbookNote < ActiveRecord::Base

  acts_as_indexed :fields => [:writer_name, :note, :response]

  validates :writer_name, :presence => true, :uniqueness => true
  
end
