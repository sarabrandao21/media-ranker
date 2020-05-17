class Work < ApplicationRecord
  has_many :votes 
  validates :title, presence: true, uniqueness: true 
  
  def create_new_vote(user_id)  
    if self.votes.find_by(user_id: user_id)
      
    else 
      return new_vote = Vote.create(user_id: user_id, work_id: self.id) 
    end 
  end
  
end 
#when the user click vote the media should know about the user and the user should know about the media 


