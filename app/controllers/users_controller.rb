class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find_by id: session[:user_id]
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "created_account"
      log_in @user
      redirect_to user_path @user
    else
     render :new
    end
  end

  def update
    @user = User.find_by id: session[:user_id]
    if @user.present? && @user.authenticate(params[:user][:password])
      @user.update_attributes profile_params
      flash[:success] = t "update_profile_success"
      render :show
    else
      flash.now[:danger] = t "wrong_password"
      render :edit
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :address, :phone, :password,
    :password_confirmation
  end

  def profile_params
    params.require(:user).permit :name, :email, :address, :phone, :password
  end
end
