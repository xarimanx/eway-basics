class OrdersNewPage < SitePrism::Page
  set_url('/orders/new')
  set_url_matcher(/\/orders\/new/)

  element :product, '#order_product'
  element :price, '#order_price'

  element :create, 'input[name="commit"]'
  element :cancel, '.btn-default', text: 'Cancel'

  def create_order(product, price)
    self.product.set(product)
    self.price.set(price)
    create.click
  end

  def form_visible?
    all_visible? :product, :price, :create, :cancel
  end

  private

  def all_visible?(*item_list)
    item_list.all? { |item| self.send(item).visible? }
  end
end
