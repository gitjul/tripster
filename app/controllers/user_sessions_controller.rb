# encoding: utf-8
class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  def create
    @user_session = UserSession.new(params[:user_session])
    puts params[:user_session]
    if @user_session.save
      flash[:success] = "Pomyślnie zalogowano."
      redirect_back_or_default root_url
    else
      render :action => 'new'
    end
  end

  def destroy
    if @user_session = UserSession.find
      @user_session.destroy
      flash[:info] = "Wylogowano z serwisu."
      redirect_to root_url
    else
      flash[:error] = "Próbujesz wykonać niedozwoloną akcję."
    end
  end
end

