module SessionsHelper
  def sign_in(user)
    user.expire_token!
    session[:user_id] = user.id
  end

  def current_user
    if (user_id = session[:user_id]) # not a comparison
      @current_user ||= MsuUser.find_by(id: session[:user_id])
    elsif (user_id = cookies.signed[:user_id]) # not a comparison
      user = MsuUser.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        sign_in_user user
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
     # user.forget
     cookies.delete(:user_id)
     cookies.delete(:remember_token)
   end

  # logs out the current user.
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

end
