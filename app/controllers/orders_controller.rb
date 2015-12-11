class OrdersController < ApplicationController

  def create
    new_order.update_attributes(order_params) ? redirect_to(orders_url, flash: { success: 'Created!' }) : render(:new)
  end

  def update
    order.update_attributes(order_params) ? redirect_to(orders_url, flash: { success: 'Updated!' }) : render(:edit)
  end

  def destroy
    order.destroy && redirect_to( orders_url, flash: { success: 'Destroyed!' })
  end

  private

  helper_method :orders
  def orders
    @orders ||= Order.all
  end

  helper_method :new_order
  def new_order
    @new_order ||= Order.new
  end

  helper_method :order
  def order
    @order ||= Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:product, :price)
  end
end
