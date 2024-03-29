class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = current_user.categories.order(created_at: :desc)
    @categories_group = @categories.group_by { |category| category.created_at.to_date }
    @amount_spent = @categories.map(&:total_amount).sum
    @budget = Budget.find_by(user_id: current_user.id)

    return unless @budget

    @available_amount = @budget.local_amount - @amount_spent
    @currency_details = @budget.exchange_rate
  end

  def show
    @category = Category.find_by(id: params[:id])
    @categories = current_user.categories
    @budget = Budget.find_by!(user_id: current_user.id)
    @currency_details = @budget.exchange_rate

    @products = if params[:search]
                  @category.products.where('name ilike ?', "%#{params[:search]}%").order(created_at: :desc)
                else
                  @category.products.order(created_at: :desc)
                end
    @products_group = @products.group_by { |product| product.created_at.to_date }
  end

  def new
    @category = Category.new
  end

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

  def user_account; end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
