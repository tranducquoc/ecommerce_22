class ProductsController < ApplicationController
  before_action :load_categories, only: [:show]

  def show
    @product = Product.find_by id: params[:id]
    if !@product
      flash[:danger] = t "find_error"
      redirect_to root_path
    end
  end
end
