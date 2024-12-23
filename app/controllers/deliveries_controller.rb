class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.all
    @total_cost = @deliveries.sum(:cost)
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      redirect_to deliveries_path
    else
      @deliveries = Delivery.all
      @total_cost = @deliveries.sum(:cost)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def delivery_params
    params.require(:delivery).permit(:pickup_address, :delivery_address, :weight, :distance, :scheduled_time)
  end
end
