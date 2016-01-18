class CheckoutNewPage
  include PageObject

  # /orders/:order_id/checkout/new

  text_field  :card_number, id: 'EWAY_CARDNUMBER'
  text_field  :card_holder, id: 'EWAY_CARDNAME'
  select_list :exp_month,   id: 'EWAY_CARDEXPIRYMONTH'
  select_list :exp_year,    id: 'EWAY_CARDEXPIRYYEAR'
  text_field  :card_cvn,    id: 'EWAY_CARDCVN'
  button      :pay_now,     id: 'EWAYPayNowButton'

  span :amount, class: 'amount'
  div  :alert,  class: 'ui-pnotify-text'

  def pay(options={})
    self.card_number = options[:card_number]
    self.card_holder = options[:card_holder]
    self.exp_month   = options[:exp_month]
    self.exp_year    = options[:exp_year]
    self.card_cvn    = options[:card_cvn]
    pay_now
  end

  def pay_as_jrandom
    pay card_number: '4444333322221111',
        card_holder: 'JOHN RANDOM',
        exp_month: 'June',
        exp_year: '2020',
        card_cvn: '132'
  end
end
