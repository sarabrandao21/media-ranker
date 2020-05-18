class Work < ApplicationRecord
  has_many :votes, dependent: :delete_all 
  validates :title, presence: true, uniqueness: true 
  
  
  def self.spotlight(type) 
    sorted = Work.all.sort_by { |work| -work.votes.length }
    list_work = []
    sorted.each do |work|
      if work.category == type  
        list_work.push(work)  
      end 
    end     
    return list_work[0..9]
  end 
  
  def create_new_vote(user_id)  
    return new_vote = Vote.create(user_id: user_id, work_id: self.id) 
  end
  
  def self.highest_voted 
    max = Work.first
    Work.all.each do |work|
      if work.votes.length > max.votes.length
        max = work 
      end 
    end 
    return max
  end 
end 



