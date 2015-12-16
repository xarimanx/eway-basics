module OrdersHelper
  def human_boolean(bool)
    bool ? 'Yes' : 'No'
  end

  def order
    @order ||= Order.find(params[:order_id])
  end
end
