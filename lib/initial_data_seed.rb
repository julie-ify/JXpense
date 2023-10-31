class InitialDataSeed
  def self.execute
    new.execute
  end

  def execute
    create_data
  end

  def create_data
    user = User.create!({ name: 'test user', email: 'testuser@gmail.com', password: 'testuser',
                          password_confirmation: 'testuser' })
    budget = Budget.find_or_create_by!(user_id: user.id)
    budget.update(usd_amount: 100000, local_amount: 100000)

    Category.create!([{ name: 'Internet', user_id: 1, created_at: 1.day.ago },
                      { name: 'Airtime', user_id: 1, created_at: 1.day.ago },
                      { name: 'Grocery', user_id: 1, created_at: 2.day.ago },
                      { name: 'Utility', user_id: 1, created_at: 2.day.ago }])

    @category1 = Category.find_by!(id: 3)
    @category1.products.create!({ name: 'milk', author_id: 1, amount: 10, created_at: 1.day.ago,
                                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac' })
    @category1.products.create!({ name: 'sugar', author_id: 1, amount: 30, created_at: 1.day.ago,
                                  description: 'ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac' })
    @category1.products.create!({ name: 'indomie', author_id: 1, amount: 50, created_at: 2.day.ago,
                                  description: 'sit amet, consectetur adipiscing elit. Mauris ac pulvinar' })
    @category1.products.create!({ name: 'toilet paper', author_id: 1, amount: 90, created_at: 2.day.ago,
                                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit' })

    @category2 = Category.find_by!(id: 4)
    @category2.products.create!({ name: 'water', author_id: 1, amount: 100, created_at: 1.day.ago,
                                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac' })
    @category2.products.create!({ name: 'light', author_id: 1, amount: 30, created_at: 2.day.ago,
                                  description: 'ipsum dolor sit amet, consectetur adipiscing elit. Maurisefficitur' })
    @category2.products.create!({ name: 'tax', author_id: 1, amount: 20, created_at: 3.day.ago,
                                  description: 'sit amet, consectetur adipiscing elit. Mauris ac augue pulvinar sem' })
  end
end
