class CarsController < ApplicationController
  before_action :find_car, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]  
  
  def index
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = current_user.cars.build(car_params)
    if @car.save
      redirect_to @car
    else
      render 'new'
    end
  end

  def update
  end

  private

  def car_params
    params.require(:car).permit(:license)
  end

  def find_car
    @car = Car.find(params[:id])
  end
end