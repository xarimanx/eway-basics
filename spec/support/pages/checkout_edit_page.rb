class CheckoutEditPage < SitePrism::Page
  set_url('/orders/{id}/checkout/edit')
  set_url_matcher(/\/orders\/\d+\/checkout\/edit/)

  class EwayForm < SitePrism::Section
    element :card_holder, '#EWAY_CARDNAME'
    element :card_number, '#EWAY_CARDNUMBER'
    element :exp_month, '#EWAY_CARDEXPIRYMONTH'
    element :exp_year, '#EWAY_CARDEXPIRYYEAR'
    element :card_cvn, '#EWAY_CARDCVN'
    element :f_name, '#EWAY_SHIPPINGFIRSTNAME'
    element :l_name, '#EWAY_SHIPPINGLASTNAME'
    element :zip, '#EWAY_SHIPPINGPOSTALCODE'
  end

  section :form, EwayForm, 'form.form.order'
end