class ImportsController < ApplicationController
  def create
    if Product.import params[:file]
      flash[:success] = t "import_success"
    else
      flash[:success] = t "import_fail"
    end
    redirect_to :back
  end
end
