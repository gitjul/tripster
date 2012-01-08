# encoding: utf-8

class UsersController < ApplicationController

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

  # GET /users/edit
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Pomyślnie zmieniono profil."
      redirect_to root_url
    else
      render :action => 'edit'
    end 
  end
end
