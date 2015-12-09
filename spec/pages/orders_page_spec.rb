require 'rails_helper'

describe 'new page' do
  let(:browser) { @browser ||= Selenium::WebDriver.for :ff }

  it {
    new_order_page = OrderNewPage.new(browser, true)
    new_order_page.create_order('test', '1')
    }

  after { browser.close }
end
