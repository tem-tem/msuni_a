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
      flash.now[:danger] = @user.error.full_messages.to_sentence
      render :new
    end

  end

  def destroy
    user = MsuUser.find(params[:id])
    suxess_msg = 'Пользователь ' + user.fullname + ' удалён'
    if user.destroy
      flash.now[:success] = suxess_msg
    else
      flash.now[:danger] = @user.error.full_messages.to_sentence
    end
  end

  private
    def user_params
      params.require(:msu_user).permit(:name, :password)
    end
end
