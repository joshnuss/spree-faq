require 'spec_helper'

describe Spree::QuestionCategory do

  let(:question_category) { create(:question_category) }
  let(:valid_attributes)  { build(:question_category) }

  subject { question_category }

  context 'instance attributes' do
    it 'create a new instance given valid attributes' do
      Spree::QuestionCategory.create!(name: valid_attributes.name)
    end
  end

  context 'factory' do
    it 'is valid' do
      expect(build(:question_category).valid?).to be_true
    end
  end

  context 'relation' do
    it { should have_many(:questions) }

    it 'have questions' do
      expect(subject.questions).not_to be_nil
    end
  end

  context 'validation' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }

    it 'is invalid without a name' do
      expect(build(:question_category, name: nil)).not_to be_valid
    end
  end

  context 'acts as list' do

    before do
      2.times { create(:question_category) }
    end

    it 'can have its position changed' do
      subject.move_to_bottom
      expect(subject.position).to eq(3)
    end
  end
end
