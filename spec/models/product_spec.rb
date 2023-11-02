require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    user = User.create(name: 'Anna', email: 'anna@gmail.com', password: '123456', password_confirmation: '123456')
    category = Category.create(name: 'Cakes', user_id: user.id)
    product = Product.new(name: 'Cup cake', amount: 100.0, author_id: user.id, category_id: category.id, description: 'lorem ipsum jifhdye hajuosid')

    it 'name should be present' do
      product.name = nil
      expect(product).to_not be_valid
    end

    it 'amount should be present' do
      product.amount = nil
      expect(product).to_not be_valid
    end

    it 'product user should be present' do
      product.user = nil
      expect(product).to_not be_valid
    end

    it 'product user should be present' do
      julie = User.create(name: 'Juliana', email: 'julie@gmail.com', password: '111111', password_confirmation: '111111')
      category = Category.create(name: 'Ice cream', user_id: julie.id)
      product2 = Product.new(name: 'Cream', amount: 100.0, author_id: julie.id, category_id: category.id, description: 'lorem ipsum jifhdye hajuosid')

      product2.save
      expect(product2.errors.full_messages).to eq([])
      expect(product2.invalid?).to be(false)
    end
  end
end
