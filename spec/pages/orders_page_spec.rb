require 'rails_helper'

describe 'Orders' do
  let(:browser) { @browser ||= Selenium::WebDriver.for :ff }
  let(:index_page) { OrdersIndexPage.new(browser) }
  after(:each) { browser.quit }

  context '#new page' do
    let(:new_page) { OrderNewPage.new(browser, true) }

    it 'create order' do
      new_page.create_order('test', '1')
      expect(index_page.text).to include('test')
    end

    it 'with errors' do
      new_page.create_order('test', 'a')
      expect(new_page.text).to include('Price is not a number')
    end
  end
end
