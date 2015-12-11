class OrdersShowPage < SitePrism::Page
  set_url('/orders/{order_id}')
  set_url_matcher(/\/orders\/\d+/)

  # element :product, '#order-product
  # element :price, '#order-price

  element :back, '.btn-default', text: 'Back'
  element :edit, '.btn-default', text: 'Edit'
  element :delete, '.btn-danger', text: 'Delete'
end
