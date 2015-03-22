class ParkdecksController < ApplicationController
  before_action :find_parkdeck, only: [:show, :edit, :update, :destroy]

  def index
    @parkdecks = Parkdeck.all
  end

  def new
    @parkdeck = Parkdeck.new
  end

  def create
    @parkdeck = Parkdeck.new(parkdeck_params)
    
    if @parkdeck.save
      redirect_to @parkdeck
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def parkdeck_params
    params.require(:parkdeck).permit(:name, :city, :lat, :lng, :pricep15)
  end

  def find_parkdeck
    @parkdeck = Parkdeck.find(params[:id])
  end


end
