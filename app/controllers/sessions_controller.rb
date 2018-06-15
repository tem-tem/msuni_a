class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    redirect_to [:admin, :msu_disciplines] if logged_in?
  end

  def create

    user = MsuUser.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      sign_in user
      remember user
      redirect_to [:admin, :msu_disciplines]

    else
      flash.now[:danger] = 'Неверная комбинация логин/пароль'
      render :new
    end

  end

  def destroy
    log_out if logged_in?
    redirect_to admin_path
  end

end
