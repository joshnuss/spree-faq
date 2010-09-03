require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Question do
  before(:each) do
    QuestionCategory.create! :name => 'foo'

    @valid_attributes = {
      :question_category_id => 1,
      :question => "value for question",
      :answer => "value for answer",
      :position => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Question.create!(@valid_attributes)
  end

  it "should belong to a category" do
    question = Question.create(@valid_attributes)
    question.question_category.should_not be_nil
  end

  it "should require a category" do
    question = Question.create(@valid_attributes.except(:question_category_id))
    question.should have(1).error_on(:question_category_id)
  end

  it "should require a question" do
    question = Question.create(@valid_attributes.except(:question))
    question.should have(1).error_on(:question)
  end

  it "should require a answer" do
    question = Question.create(@valid_attributes.except(:answer))
    question.should have(1).error_on(:answer)
  end

  it "should act like a list" do
    question = Question.create(@valid_attributes)
    Question.create(@valid_attributes)
    
    question.move_to_bottom
    question.position.should eql(2)
  end
end
