class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:before_log_in_url) || tests_path
    else
      flash.now[:alert] = 'Не вижу легитимности в твоем пребывании здесь, авторизуйся! =/'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_url
  end
end
