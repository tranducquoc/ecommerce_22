class UsersController < ApplicationController
  def signup
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t("created_account")
      log_in @user
      redirect_to root_path
    else
     render :new
   end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :address, :phone, :password,
      :password_confirmationx
  end
end
