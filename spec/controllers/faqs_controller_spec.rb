require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FaqsController do

  it "should response to index" do
    QuestionCategory.should_receive(:all).and_return(:categories)

    get :index

    assigns(:categories).should eql(:categories)
    response.should be_success
  end

  it "should response to show" do
    Question.should_receive(:find).with('1').and_return(:question)

    get :show, :id => 1

    assigns(:question).should eql(:question)
    response.should be_success
  end

end
