class ProductsController < ApplicationController
  def index
  end
  
    
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    respond_to do |format|
      if @product.save
        format.html { redirect_to category_path(@product.categories.first.id), notice: 'Product was successfully created!.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def product_params
    params.require(:product).permit(:name, :amount, category_ids: [])
  end
end
