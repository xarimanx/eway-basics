require_relative 'general_page'

class CheckoutNewPage < GeneralPage
  set_url('/orders/{order_id}/checkout/new')
  set_url_matcher(/secure-au.sandbox.ewaypayments.com\/sharedpage\/sharedpayment\?AccessCode=.+/)

  class CreditCardForm < SitePrism::Section
    element :amount, '.amount'
    element :card_holder, '#EWAY_CARDNAME'
    element :card_number, '#EWAY_CARDNUMBER'
    element :exp_month, '#EWAY_CARDEXPIRYMONTH'
    element :exp_year, '#EWAY_CARDEXPIRYYEAR'
    element :card_cvn, '#EWAY_CARDCVN'
    element :pay_now, '#EWAYPayNowButton'
  end

  section :card_form, CreditCardForm, '#creditcard-form-wrapper'
  element :alert, '.ui-pnotify-text'
  element :customer_details, '#customerdetails-form'
  element :shipping_details, '#shippingdetails-form'

  delegate *CreditCardForm.mapped_items, to: :card_form, prefix: false

  def forms_visible?
    all_visible? :card_form, :customer_details, :shipping_details
  end

  def pay(options={})
    card_holder.set options[:card_holder]
    card_number.set options[:card_number]
    exp_month.set   options[:exp_month]
    exp_year.set    options[:exp_year]
    card_cvn.set    options[:card_cvn]
    pay_now.click
  end

  def pay_as_jrandom
    pay card_holder: 'JOHN RANDOM',
        card_number: '4444333322221111',
        exp_month: '10',
        exp_year: '20',
        card_cvn: '123'
  end
end
