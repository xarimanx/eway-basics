require_relative 'general_page'

class OrdersNewPage < GeneralPage
  set_url('/orders/new')
  set_url_matcher(/\/orders\/new/)

  element :error, '.has-error'
  element :product, '#order_product'
  element :price, '#order_price'
  element :cancel, '.btn-default', text: 'Cancel'

  def create_order(product, price)
    self.product.set(product)
    self.price.set(price)
    submit.click
  end

  def form_visible?
    all_visible? :product, :price, :submit, :cancel
  end
end
