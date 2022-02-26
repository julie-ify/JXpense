class ProductsController < ApplicationController
  load_and_authorize_resource

  def new
    @category = Category.find_by(id: params[:category_id])
    # @categories = current_user.categories
  end

  def create
    
    @category = Category.find_by(id: params[:category_id])
    @product = @category.products.new(product_params)
    @product.user = current_user

    respond_to do |format|
      if @product.save
        format.html do
          redirect_to category_path(@product.categories.first.id), notice: 'Product was successfully created!.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @category =  Category.find_by(id: params[:category_id])
    @product = @category.products.find(params[:id])
  end
  
  def update
    @category =  Category.find_by(id: params[:category_id])
    @product = @category.products.find(params[:id])

    if @product.update(product_params)
      redirect_to categories_path, notice: 'Product was successfully updated!.'
    else
        render 'edit'
    end
  end


  def destroy
    @category =  Category.find_by(id: params[:category_id])
    @product = @category.products.find(params[:id])

    @product.destroy

    redirect_to categories_url, notice: 'Product was successfully deleted!'
  end

  private

  def product_params
    params.require(:product).permit(:name, :amount, category_ids: [])
  end
end
