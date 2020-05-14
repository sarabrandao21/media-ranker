class Work < ApplicationRecord
  has_many :votes #TODO how can the id be unique
  validates :title, presence: true, uniqueness: true 
  
end
