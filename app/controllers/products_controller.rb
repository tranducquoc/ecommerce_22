class ProductsController < ApplicationController
  layout "admin_layout"

  def new
    @categories = Categorie.all
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "created_product"
      redirect_to new_product_path
    else
     render :new
    end
  end

  private

  def product_params
    params.require(:product).permit :name, :info, :price, :categrie_id, :picture
  end
end
