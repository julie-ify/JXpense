class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = current_user.categories.order(created_at: :desc)
    @categories_group = @categories.group_by { |category| category.created_at.to_date }
    amount_spent_in_usd = @categories.map(&:total_amount).sum
    @budget = Budget.find_or_create_by!(user_id: current_user.id)
    @available_amount = current_user.budget.local_amount - conversion(@budget, amount_spent_in_usd)
		@currency_details = @budget.exchange_rate
		@amount_spent = conversion(@budget, amount_spent_in_usd)
  end

  def show
    @category = Category.find_by(id: params[:id])
    @products = @category.products.order(created_at: :desc)
    @products_group = @products.group_by { |product| product.created_at.to_date }
    @categories = current_user.categories

		@budget = Budget.find_by!(user_id: current_user.id)
		@currency_details = @budget.exchange_rate
		@product_amount = @category.total_amount * @currency_details.rate_in_usd
  end

  def new
    @category = Category.new
  end

  def sign_out; end

  def create
    @category = Category.new(category_params)
    current_user.categories << @category
    if @category.save
      redirect_to categories_url, notice: 'Category was successfully created!.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated!.'
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.products.destroy_all
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully deleted!'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
