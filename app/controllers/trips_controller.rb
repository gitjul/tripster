# encoding: utf-8
class TripsController < ApplicationController
  before_filter :authenticate, :only => [:new, :edit, :destroy]
  before_filter :admin_required, :only => [:destroy]

  def index
    @trips = Trip.order('created_at desc').page(params[:page]).per(10)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(params[:trip])
    @trip.user = current_user
    if @trip.save
      flash[:success] = "Podróż została utworzona!"
      redirect_to @trip
    else
      render :action => 'new'
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(params[:trip])
      flash[:success] = "Poprawnie zaaktualizowano podróż."
      redirect_to @trip
    else
        render :action => 'edit'
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    flash[:info] = "Usunięto podróż."
    redirect_to trips_path
  end
end

