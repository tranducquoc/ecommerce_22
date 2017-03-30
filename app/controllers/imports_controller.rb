class ImportsController < ApplicationController
  def create
    if Product.import params[:file]
      flash[:success] = t "import_success"
      redirect_to new_product_path
    else
      lash[:success] = t "import_fail"
      redirect_to new_product_path
    end
  end
end
