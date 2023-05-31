class OrdersController < ApplicationController
  def index
    @cars = policy_scope(Car)
    @orders = Order.where(user_id: current_user.id)
  end


  def create
    @car = Car.find(params[:car_id])
    @order = Order.new(car_id: params[:car_id], user_id: current_user.id)
    @order.car = @car
    @order.user = current_user
    authorize @car
    @car.sold = true
    if @order.save && @car.save
      redirect_to orders_path(@order)
    else
      render "cars/show"
    end
  end

  def show
    @cars = policy_scope(Car)
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
  end

  private

  def order_params
    params.require(:order).permit(:car_id)
  end
end
