class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :detroy]
  # before_action :authenticate_user!

  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def new
    @bike =Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      flash[:success] = "New bike was successfully uploaded."
      redirect_to bikes_path
    else
    render 'new'
    end
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def update

  end

  private

  def bike_params
    params.requre(:bike).permit(:brand, :model_year, :model)
  end

end
