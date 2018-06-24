class Admin::MsuUsersController < ApplicationController

  def index
    @users = MsuUser.all
  end

  def new
    @user = MsuUser.new
  end

  def create
    @user = MsuUser.new(user_params)
    if @user.save
      redirect_to [:admin, :msu_users]
    else
      flash.now[:danger] = @user.errors.full_messages.to_sentence
      render :new
    end

  end

  def destroy
    user = MsuUser.find(params[:id])
    if user
      username = user.name
      if user.destroy
        flash[:success] = 'Пользователь' + username + ' удалён'
      else
        flash[:danger] = @user.error.full_messages.to_sentence
      end
    else
      flash[:danger] = 'Пользователь не найден'
    end
    redirect_to [:admin, :msu_users]
  end

  private
    def user_params
      params.require(:msu_user).permit(:name, :password, :admin)
    end
end
