class OrdersShowPage < SitePrism::Page
  set_url('/orders/{order_id}')
  set_url_matcher(/\/orders\/\d+/)

  element :back, '.btn-default', text: 'Back'
  element :edit, '.btn-default', text: 'Edit'
  element :delete, '.btn-danger', text: 'Delete'
end
