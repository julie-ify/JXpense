require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { User.new(name: 'Annna', email: 'anna@gmail.com') }

    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'email should be present' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many categories' do
      expect(User.reflect_on_association(:categories).macro).to eq(:has_many)
    end

    it 'has many to recipes' do
      expect(User.reflect_on_association(:products).macro).to eq(:has_many)
    end
  end
end
