require "test_helper"

describe Work do
  before do 
    @new_work = Work.new(category: "album",title: "Blue Breaker",creator: "Dr. Sarai Langosh",publication_year: "1949", description: "Et et expedita non aut quo.")
  end 
  describe 'validations' do 
    
    it "can create work just with title" do 
      only_title_work = Work.new(title: "Hello World")
      expect(only_title_work.valid?).must_equal true 
    end 
    it "does not create work if there is no title" do 
      @new_work.title = nil 
      expect(@new_work.valid?).must_equal false
      expect(@new_work.errors.messages).must_include :title
      expect(@new_work.errors.messages[:title]).must_equal ["can't be blank"]
    end 
    it "fails validation when title already exist " do 
      @new_work.save
      second_work = Work.create(title: @new_work.title)
      expect(second_work.valid?).must_equal false 
      expect(second_work.errors.messages).must_include :title
      expect(second_work.errors.messages[:title]).must_equal ["has already been taken"]
    end 
  end
  
  describe "Relations" do 
    it "can have multiple votes"  do 
      @new_work.save
      user_one = User.create(username: "benilsen")
      user_two = User.create(username: "saranilsen")
      vote_one = Vote.create(work_id: @new_work.id, user_id: user_one.id)
      vote_two = Vote.create(work_id: @new_work.id, user_id: user_two.id)
      expect(@new_work.votes.length).must_equal 2
    end 
  end 
  describe "Spotlight" do 
    it "returns 10 works" do 
      
    end 
    it "does not return more than 10 works" do 
    end 
    it "return a list of works sorted by highest votes" do 
    end 
  end 
  describe "Create new vote" do 
    it "vote can be created" do 
    end 
  end 
end 
