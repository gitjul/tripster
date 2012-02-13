# encoding: utf-8
class UsersController < ApplicationController

  before_filter :authenticate, :only => [:edit, :edit_avatar]
  before_filter :admin_required, :only => [:delete]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Pomyślnie zarejestrowano konto."
      redirect_to users_url
    else
      render :action => 'new'
    end
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    unless current_user && (current_user == @user or current_user.admin?)
      flash[:notice] = "Próbujesz wykonać niedozwoloną akcję. Nieładnie."
      redirect_to root_url
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Zapisano zmiany."
      redirect_to user_path(@user.id)
    else
      render :action => 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Usunięto użytkownika."
    redirect_to users_url
  end

  # GET /users/1/edit_avatar
  def edit_avatar
    @user = User.find(params[:id])
    unless current_user && (current_user == @user or current_user.admin?)
      flash[:notice] = "Próbujesz wykonać niedozwoloną akcję. Nieładnie."
      redirect_to root_url
    end
  end

  def update_avatar
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Pomyślnie zmieniono avatar."
      redirect_to user_path(@user.id)
    else
      render :action => 'edit_avatar'
    end
  end
end

