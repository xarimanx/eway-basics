class OrdersNewPage < SitePrism::Page
  set_url('/orders/new')
  set_url_matcher(/\/orders\/new/)

  element :error, '.has-error'

  element :product, '#order_product'
  element :price, '#order_price'

  element :save, 'input[name="commit"]'
  element :cancel, '.btn-default', text: 'Cancel'

  def create_order(product, price)
    self.product.set(product)
    self.price.set(price)
    save.click
  end

  def form_visible?
    all_visible? :product, :price, :save, :cancel
  end

  private

  def all_visible?(*item_list)
    item_list.all? { |item| self.send(item).visible? }
  end
end
