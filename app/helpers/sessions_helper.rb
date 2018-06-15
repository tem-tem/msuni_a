module SessionsHelper

  def sign_in(user)
    session[:user_id] = user.id
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= MsuUser.find_by(id: session[:user_id])
    elsif (user_id = cookies.signed[:user_id])
      user = MsuUser.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        sign_in user
        @current_user = user
      end
    end
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def forget(user)
     user.forget
     cookies.delete(:user_id)
     cookies.delete(:remember_token)
   end

  # logs out the current user.
  def log_out
    forget current_user
    session.delete(:user_id)
    @current_user = nil
  end


end
