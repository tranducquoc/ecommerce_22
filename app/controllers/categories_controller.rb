class CategoriesController < ApplicationController
  layout "admin_layout"

  before_action :load_categorie, only: [:destroy, :update]

  def new
    @categorie = Categorie.new
    @categories = Categorie.paginate page: params[:page],
      per_page: Settings.maximum_per_page
  end

  def create
    @categorie = Categorie.new categorie_params
    if @categorie.save
      flash[:success] = t "created_categorie"
      redirect_to new_category_path
    else
      @categories = Categorie.all
      render :new
    end
  end

  def destroy
    if @categorie.products.size > 0
      flash[:danger] = t "delete_categorie_error"
    else
      if @categorie.destroy
        flash[:success] = t "delete_categorie_success"
      else
        flash[:danger] = t "delete_categorie_fail"
      end
    end
    redirect_to new_category_path
  end

  def update
    if @categorie.update_attributes categorie_params
      flash[:success] = t "update_categorie_success"
    else
      flash[:danger] = t "update_categorie_fail"
    end
    redirect_to new_category_path
  end

  private

  def load_categorie
    @categorie = Categorie.find_by id: params[:id]
    return if @categorie
    flash[:danger] = t "find_error"
    redirect_to new_category_path
  end

  def categorie_params
    params.require(:categorie).permit :name, :image
  end
end
