class SessionsController < ApplicationController
  def new
  end

  def admin_login
    admin = User.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password]) && admin.is_admin?
      login_admin admin
      redirect_to admin_path
    else
      flash.now[:danger] = t "invalid_email_password_combination"
      render :new
    end
  end

  def admin_logout
    logout_admin
    redirect_to admin_path
  end

  def login
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      flash[:success] = t "logged_in_successfully"
      redirect_to user_path user
    else
      flash.now[:danger] = t "invalid_email_password_combination"
      render :new
    end
  end

  def logout
    log_out if loged?
    redirect_to root_url
  end
end
