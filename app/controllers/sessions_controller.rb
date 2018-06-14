class SessionsController < ApplicationController
  skip_before_action :require_login

  def auth
    token = params[:token].to_s
    user_id = params[:user_id]
    user = MsuUser.find(user_id)

    respond_to do |f|
      f.js do
        if token == user.login_token
          sign_in user
          remember(user)

          flash[:info] = 'Здравствуйте, ' + user.fullname
          redirect_to [:admin, :msu_disciplines]
        else
          error = false
          if user.login_token_expired?
            error = 'Код не действителен'
          else
            error = 'Неверный код'
          end

          if error
            flash.now[:danger] = error
            render :new
          end
        end
      end
    end

  end

  def new
    redirect_to [:admin, :msu_disciplines] if logged_in?
  end

  def create
    email = params[:email]
    user = MsuUser.find_by(email: email) if email

    if !user
      flash[:danger] = 'Пользователь не найден'
      render :new
    else
      user.send_login_link
      @user = user
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to admin_path
  end

end
