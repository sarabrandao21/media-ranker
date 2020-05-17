class Work < ApplicationRecord
  has_many :votes 
  validates :title, presence: true, uniqueness: true 
  #each category 
  #votes.length
  
  def self.spotlight
    all_votes = Work.all.map do |work|
      work.votes
    end 
    
    return all_votes.sort_by { |vote| -vote.length }
    
  end 
  
  def create_new_vote(user_id)  
    return new_vote = Vote.create(user_id: user_id, work_id: self.id) 
  end
  
end 



