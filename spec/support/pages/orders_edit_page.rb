require_relative 'orders_new_page'

class OrdersEditPage < OrdersNewPage
  set_url('/orders/{order_id}/edit')
  set_url_matcher(/\/orders\/\d+\/edit/)
end
