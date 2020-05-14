require "test_helper"

describe Work do
  describe 'validations' do 
    before do 
      @new_work = Work.new(category: "album",title: "Blue Breaker",creator: "Dr. Sarai Langosh",publication_year: "1949", description: "Et et expedita non aut quo.")
    end 
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
      second_work = Work.new(title: @new_work.title)
      expect(second_work.valid?).must_equal false 
      expect(@new_work.errors.messages).must_include :title
      expect(@new_work.errors.messages[:title]).must_equal ["has already been taken"]
    end 
  end
  
  # description "Relations" do 
  #   it 
  # end 
end 
