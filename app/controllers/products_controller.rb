class ProductsController < ApplicationController
  load_and_authorize_resource

  def new
    @category = Category.find_by(id: params[:category_id])
    @product = @category.products.new
  end

  def create
    @category = Category.find_by(id: params[:category_id])
    @product = @category.products.build(product_params)
    @product.user = current_user

    if @product.save
      redirect_to category_path(@category.id), notice: 'Product was successfully created!.'
    else
      render :new
    end
  end

  def edit
    @category = Category.find_by(id: params[:category_id])
    @product = @category.products.find(params[:id])
  end

  def update
    @category = Category.find_by(id: params[:category_id])
    @product = @category.products.find(params[:id])

    if @product.update(product_params)
      redirect_to categories_path, notice: 'Product was successfully updated!.'
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find_by(id: params[:category_id])
    @product = @category.products.find(params[:id])
    @product.destroy

    redirect_to categories_url, notice: 'Product was successfully deleted!'
  end

  private

  def product_params
    params.require(:product).permit(:name, :amount, :description)
  end
end
