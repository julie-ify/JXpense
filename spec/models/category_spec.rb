require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    subject { Category.new(name: 'Fast food', icon: 'https://www.pselaw.com/wp-content/uploads/2016/08/istockpikachu-160x160.jpg') }

    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'icon should be present' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it 'should have many payments' do
      expect(Category.reflect_on_association(:payments).macro).to eq(:has_many)
    end

    it 'should have many products through payment' do
      expect(Category.reflect_on_association(:products).macro).to eq(:has_many)
    end

    it 'should belongs to user' do
      expect(Category.reflect_on_association(:user).macro).to eq(:belongs_to)
    end
  end
end
