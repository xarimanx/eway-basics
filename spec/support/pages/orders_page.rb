class OrdersPage < SitePrism::Page
  set_url('/orders')
  set_url_matcher(/\/orders/)

  element :pay_now, '.eway-button'
  element :shared_page, '.btn-primary', text: 'Get Shared Page'
  element :payment_page, '.btn-primary', text: 'Payment Page'

  element :new, '.btn-primary', text: 'New'
end
