require "test_helper"

describe Vote do
  describe "relations" do 
    it "can have user and work" do 
      new_work = Work.create(category: "album",title: "Blue Break",creator: "Dr. Sarai Langosh",publication_year: "1949", description: "Et et expedita non aut quo.")
      user_one = User.create(username: "benilsen")
      vote = Vote.create(work_id: new_work.id, user_id: user_one.id)
      expect(vote.work_id).must_equal new_work.id
      expect(vote.user_id).must_equal user_one.id
    end 
  end 
end
