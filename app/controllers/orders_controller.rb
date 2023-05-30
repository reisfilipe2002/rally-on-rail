class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    @car = Car.find(params[:car_id])
    @order.car = @car
    @order.user = current_user
    if @order.save
      redirect_to car_path(@car)
    else
      render "cars/show"
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:start_date, :end_date)
  end
end
