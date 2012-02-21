# encoding: utf-8
class PicturesController < ApplicationController

  before_filter :authenticate, :only => [:new, :edit]

  # GET trips/1/pictures
  def index
    @imageable = find_imageable
    @pictures = @imageable.pictures
  end

  # GET trips/1/pictures/1
  def show
    @imageable = find_imageable
    @picture = @imageable.pictures.find(params[:id])
  end

  # GET trips/1/pictures/new
  def new
    @imageable = find_imageable
    @picture = @imageable.pictures.new
  end

  # POST /trips/1/pictures
  def create
    @imageable = find_imageable
    @picture = @imageable.pictures.build(params[:picture])

    if @picture.save
      flash[:success] = 'Pomyślnie dodano zdjęcie.'
      if @picture.imageable_type == 'Point'
        redirect_to @picture.imageable.trip
      else
        redirect_to @picture.imageable
      end
    else
      render :action => 'new'
    end
  end

  # GET trips/1/pictures/1/edit
  def edit
    @imageable = find_imageable
    @picture = Picture.find(params[:id])
  end

  # PUT trips/1/pictures/1
  def update
    @imageable = find_imageable
    @picture = @imageable.pictures.find(params[:id])

    if @picture.update_attributes(params[:picture])
      flash[:success] = 'Pomyślnie nadpisano zdjęcie.'
      if @picture.imageable_type == 'Point'
        redirect_to @picture.imageable.trip
      else
        redirect_to @picture.imageable
      end
    else
      render :action => 'edit'
    end
  end

  # DELETE /trips/1/pictures/1
  def destroy
    @imageable = find_imageable
    @picture = @imageable.pictures.find(params[:id])
    @picture.destroy
    flash[:info] = 'Usunięto zdjęcie.'
    if @picture.imageable_type == 'Point'
        redirect_to @picture.imageable.trip
      else
        redirect_to @picture.imageable
    end
  end

  private

  def find_imageable
    params.each do |name, id|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(id)
      end
    end
    nil
  end
end

