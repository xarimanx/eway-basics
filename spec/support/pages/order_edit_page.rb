require_relative 'general_page'

class OrderEditPage < GeneralPage
  include PageObject

  # /orders/:id/edit

  text_field  :card_holder, id: 'EWAY_CARDNAME'
  text_field  :card_number, id: 'EWAY_CARDNUMBER'
  select_list :exp_month,   id: 'EWAY_CARDEXPIRYMONTH'
  select_list :exp_year,    id: 'EWAY_CARDEXPIRYYEAR'
  text_field  :card_cvn,    id: 'EWAY_CARDCVN'
  text_field  :f_name,      id: 'EWAY_SHIPPINGFIRSTNAME'
  text_field  :l_name,      id: 'EWAY_SHIPPINGLASTNAME'
  text_field  :zip,         id: 'EWAY_SHIPPINGPOSTALCODE'

  def pay(options={})
    self.card_holder = options[:card_holder]
    self.card_number = options[:card_number]
    self.exp_month   = options[:exp_month]
    self.exp_year    = options[:exp_year]
    self.card_cvn    = options[:card_cvn]
    self.f_name      = options[:f_name]
    self.l_name      = options[:l_name]
    self.zip         = options[:zip]
    submit
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
