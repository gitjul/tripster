class TripsController < ApplicationController
  before_filter :authenticate

  def index
    @trips = Trip.order('created_at desc').all
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
    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip }
      else
        format.html { render :action => 'new' }
      end
    end
  end
end
