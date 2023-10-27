class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = current_user.categories.order(created_at: :desc)
    @categories_group = @categories.group_by { |category| category.created_at.to_date }
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def sign_out; end

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

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

		if  @category.update(category_params)
			redirect_to categories_path(@category), notice: 'Category was successfully updated!.'
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_url, notice: 'Category was successfully deleted!'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
