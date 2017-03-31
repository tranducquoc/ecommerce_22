class ProductsController < ApplicationController
  layout "admin_layout"

  before_action :load_product, only: [:destroy, :update]

  def new
    @categories = Categorie.all
    @product = Product.new
  end

  def create
    @categories = Categorie.all
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "created_product"
      redirect_to new_product_path
    else
     render :new
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t "delete_product_success"
    else
      flash[:danger] = t "delete_product_fail"
    end
    redirect_to products_path
  end

  def index
    @categories = Categorie.all
    @products = Product.paginate page: params[:page],
      per_page: Settings.maximum_per_page
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "update_product_success"
    else
      flash[:danger] = t "update_product_fail"
    end
    redirect_to products_path
  end

  private

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t "find_error"
    redirect_to product_path
  end

  def product_params
    params.require(:product).permit :name, :info, :price, :image, :categorie_id
  end
end
