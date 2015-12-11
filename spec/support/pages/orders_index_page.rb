class OrdersIndexPage
  include PageObject

  page_url 'http://lvh.me:3000'

  button(:new_button, link: 'New')
  button(:shared_page, link: 'Get Shared Page') # checkout_new
  button(:payment_page, link: 'Payment Page') # checkout_edit
  button(:pay_now, css: '.eway-button')

  # link(:order, link: "#{order.product}")
  # table(:orders, css: '.table-striped')
end
