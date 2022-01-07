require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    image = 'https://www.pselaw.com/wp-content/uploads/2016/08/istockpikachu-160x160.jpg'
    user = User.create(name: 'Anna', email: 'anna@gmail.com', password: '123456')
    category = Category.create(name: 'Cakes', icon: image, user_id: user.id)
    product = Product.new(name: 'Cup cakeake', amount: 100.0, author_id: user.id, category_ids: category.id)

    it 'name should be present' do
      product.name = nil
      expect(product).to_not be_valid
    end

    it 'amount should be present' do
      product.amount = nil
      expect(product).to_not be_valid
    end

    it 'aleast one category should be present' do
      product.categories = []
      expect(product).to_not be_valid
    end

    it 'product user should be present' do
      product.user = nil
      expect(product).to_not be_valid
    end

    it 'product user should be present' do
      img = 'https://www.pselaw.com/wp-content/uploads/2016/08/istockpikachu-160x160.jpg'
      julie = User.create(name: 'Juliana', email: 'julie@gmail.com', password: '111111')
      category = Category.create(name: 'Ice cream', icon: img, user_id: julie.id)
      product2 = Product.new(name: 'Cream', amount: 100.0, author_id: julie.id, category_ids: category.id)

      product2.save
      expect(product2.persisted?).to be(true)
    end
  end
end
