class Work < ApplicationRecord
  has_many :votes 
  validates :title, presence: true, uniqueness: true 
  #each category 
  #votes.length
  
  def self.spotlight(type) 
    sorted = Work.all.sort_by { |work| -work.votes.length }
    list_work = Work.all.map do |work|
      if work.category == type     
      end 
    end 
    return list_work
  end 
  
  def create_new_vote(user_id)  
    return new_vote = Vote.create(user_id: user_id, work_id: self.id) 
  end
  
end 



