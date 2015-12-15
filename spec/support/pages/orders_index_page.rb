class OrdersIndexPage < SitePrism::Page
  set_url('/orders')
  set_url_matcher(/\/orders/)

  class OrderSection < SitePrism::Section
    element :link, "a[href=\"#{/orders\/\d+/}\"]"
    element :pay_now, '.eway-button'
    element :shared_page, '.btn-primary', text: 'Get Shared Page'
    element :payment_page, '.btn-primary', text: 'Payment Page'
  end

  element :success, '.alert-success'
  element :alert, '.alert-danger'
  element :new, '.btn-primary', text: 'New'
  section :order_table, OrderSection, '.table.table-striped>tbody>tr'

end
