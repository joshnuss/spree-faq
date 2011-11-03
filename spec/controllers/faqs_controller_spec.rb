require 'spec_helper'
require 'faqs_controller'

describe FaqsController do

  it "should response to index" do
    QuestionCategory.should_receive(:all).and_return(:categories)

    get :index

    assigns(:categories).should eql(:categories)
    response.should be_success
  end

end
