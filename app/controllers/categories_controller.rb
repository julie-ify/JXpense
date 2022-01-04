class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    current_user.categories << @category

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: 'Category was successfully created!.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
