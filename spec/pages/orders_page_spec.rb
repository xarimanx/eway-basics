require 'rails_helper'

describe 'Orders', type: :feature do
  let(:browser) { @browser ||= Selenium::WebDriver.for :ff }
  let(:index_page) { OrdersIndexPage.new(browser) }
  after(:each) { browser.quit }

  context '#new page' do
    let(:new_page) { OrderNewPage.new browser, true }

    it 'create order' do
      new_page.create_order('test', '1')
      expect(index_page.text).to include('test')
    end

    it 'with errors' do
      new_page.product = 'test_product'
      new_page.price = 'not_number'
      new_page.submit
      expect(new_page.text).to include('Price is not a number')
    end
  end

  context '#edit page' do
    let(:edit_page) { OrderEditPage.new browser, false }
    let!(:order) { create :order }
    before(:each) { edit_page.navigate_to edit_order_checkout_url(order) }

    it 'pay order' do
      edit_page.pay_as_jrandom
      expect(index_page.text).to include('Transaction Approved')
    end

    it 'wrong payment' do
      edit_page.pay(card_holder: 'JOHN RANDOM',
                    exp_month: '10',
                    exp_year: '2020',
                    card_cvn: '123')
      expect(index_page.text).to include('Error: Invalid Card Number')
    end
  end

  describe '#checkout new page' do
    let(:checkout_page) { CheckoutNewPage.new browser, false }
    let!(:order) { create :order }
    before(:each) { checkout_page.navigate_to new_order_checkout_url(order) }

    it { expect(checkout_page.current_url).to include('https://secure-au.sandbox.ewaypayments.com/sharedpage/sharedpayment?AccessCode=') }

    it 'successful payment' do
      checkout_page.pay_as_jrandom
      expect(index_page.text).to include('Transaction Approved')
    end

    it 'wrong payment' do
      checkout_page.pay(card_holder: 'JOHN RANDOM',
                        card_number: '0000333322221111',
                        exp_month: 'June',
                        exp_year: '2020',
                        card_cvn: '132')
      expect(checkout_page.alert).to eq('Invalid Card Number')
    end
  end
end
