require 'spec_helper'

describe Spree::Admin::QuestionCategoriesController do
  stub_authorization!

  let!(:user) { create(:user) }
  let!(:question_category) { create(:question_category) }
  let!(:question) { create(:question, question_category: question_category) }
  let (:attributes) { attributes_for(:question_category) }

  before { controller.stub spree_current_user: user }

  context 'controller instance' do
    it 'use Admin::QuestionCategoriesController' do
      expect(controller).to be_an_instance_of Spree::Admin::QuestionCategoriesController
    end
  end

  context '#index' do
    specify do
      spree_get :index
      expect(response).to render_template :index
    end
  end

  context '#new' do
    before { spree_get :new }

    it { expect(assigns(:question_category)).to be_a_new Spree::QuestionCategory }
    it { expect(response).to render_template :new }
  end

  context '#edit' do
    before { spree_get :edit, id: question_category }

    it { expect(assigns(:question_category)).to eq question_category }
    it { expect(response).to render_template :edit }
  end

  context '#create' do
    context 'with valid params' do
      it 'creates a new Spree::QuestionCategory' do
        expect {
          spree_post :create, question_category: attributes
        }.to change(Spree::QuestionCategory, :count).by(1)
      end

      it 'assigns a newly created question_category as @question_category' do
        spree_post :create, question_category: attributes
        expect(assigns(:question_category)).to be_a Spree::QuestionCategory
        expect(assigns(:question_category)).to be_persisted
      end
    end
  end

  context '#destroy' do
    it 'destroys the requested question_category' do
      expect {
        spree_delete :destroy, id: question_category
      }.to change(Spree::QuestionCategory, :count).by(-1)
    end

    it 'requires the :id parameter' do
      expect { spree_delete :destroy }.to raise_error
    end
  end

  context 'permitted attributes' do
    let(:permitted_attributes) do
      [:questions_attributes, :question, :answer,
        question: [:question_category_id, :question, :answer]]
    end

    specify do
      controller.params = { question_category: attributes }
      controller.params.require(:question_category).should_receive(:permit).with(*permitted_attributes)
      controller.send :question_category_params
    end
  end
end
