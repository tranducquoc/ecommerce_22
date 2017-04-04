class CategoriesController < ApplicationController
  before_action :load_categories, only: [:show]

  def show
    @categorie = Categorie.find_by id: params[:id]
    if @categorie
      @products = @categorie.products.paginate page: params[:page],
        per_page: Settings.maximum_per_page
    else
      flash[:danger] = "find_error"
      redirect_to :back
    end
  end
end
