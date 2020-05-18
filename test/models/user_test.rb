require "test_helper"

describe User do
  before do
    @user = User.create(username: "saranilsen")
  end
  describe 'validations' do  
    it 'is valid when all fields are present' do
      result = @user.valid?
      expect(result).must_equal true
    end
    
    it 'is invalid without a username' do
      @user.username = nil
      result = @user.valid?
      
      expect(result).must_equal false
      expect(@user.errors.messages).must_include :username
    end
    
    it 'cannot create a user with an existing username' do
      @new_user = User.new(username: @user.username)
      result = @new_user.save
      
      expect(result).must_equal false
    end
  end
  describe 'relations' do
    it "can have multiple votes"  do 
      work_one = Work.create(category: "album", title: "Blue Breaker", creator: "Dr. Sarai Langosh", publication_year: "1949", description: "Et et expedita non aut quo.")
      work_two = Work.create(category: "book", title: "Postmodern Blend", creator: "Dr. Sarai Langosh", publication_year: "1949", description: "Et et expedita non aut quo.")
      vote_one = Vote.create(work_id: work_one.id, user_id: @user.id)
      vote_two = Vote.create(work_id: work_two.id, user_id: @user.id)
      expect(@user.votes.length).must_equal 2
    end 
  end 
end 
