class CheckoutEditPage < SitePrism::Page

  set_url('/orders/{order_id}/checkout/edit')
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
    element :submit, 'input[name="commit"]'
  end

  section :form, EwayForm, '.form.order'

  delegate *EwayForm.mapped_items, to: :form, prefix: false

  def pay(options={})
    card_holder.set options[:card_holder]
    card_number.set options[:card_number]
    exp_month.set   options[:exp_month]
    exp_year.set    options[:exp_year]
    card_cvn.set    options[:card_cvn]
    f_name.set      options[:f_name]
    l_name.set      options[:l_name]
    zip.set         options[:zip]
    submit.click
  end

  def pay_as_jrandom
    pay card_holder: 'JOHN RANDOM',
        card_number: '4444333322221111',
        exp_month: '10',
        exp_year: '2020',
        card_cvn: '132',
        f_name: 'John',
        l_name: 'Random',
        zip: '123456'
  end
end
