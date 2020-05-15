class Work < ApplicationRecord
  has_many :votes #TODO how can the id be unique
  validates :title, presence: true, uniqueness: true 
  
  #TODO get the 10 most voted from each type 
  
end
