class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cars = Car.all
    @cars = policy_scope(Car)
  end

  def show
    @car = Car.find(params[:id])
    authorize @car
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create
    @car = Car.new(cars_params)
    @car.user = current_user
    authorize @car
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
    authorize @car
  end

  def update
    @car = Car.find(params[:id])
    authorize @car
    @car.update(cars_params)
    if @car.update(cars_params)
      redirect_to @car, notice: 'Car updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @car = Car.find(params[:id])
    authorize @car
    @car.destroy
    redirect_to cars_path(current_user)
  end

  private

  def cars_params
    params.require(:car).permit(:brand, :model, :price, :user_id, :photo)
  end

end
