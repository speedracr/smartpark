class ParkingsController < ApplicationController
  before_action :find_parking, only: [:show, :checkout, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @parkings = Parking.all
  end

  def new
    @starttime = Time.now
    @parking = Parking.new
  end

  def create
    @parking = current_user.parkings.build(parking_params)
    if @parking.save
      redirect_to @parking
    else
      render 'new'
    end
  end

  def edit
    @parking = current_user.parkings.find(params[:id])
    @endtime = @parking.end
  end

  def update
    @parking = current_user.parkings.update(parking_params)
    @endtime = @parking.end
    if @parking.update(parking_params)
      redirect_to @parking
    else
      render 'edit'
    end
  end

  def checkout
    endtime = Time.now
    parking = Parking.find(params[:id])
    parking.update_attribute(:end, endtime)
    redirect_to parking
  end  

  def destroy
  end

  private

  def parking_params
    params.require(:parking).permit(:start, :end, :ispaid, :amount, :lat, :lng)
  end

  def find_parking
    @parking = Parking.find(params[:id])
  end


end
