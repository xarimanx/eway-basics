require 'rails_helper'

describe 'new page' do
  let(:browser) { @browser ||= Selenium::WebDriver.for :ff }
  let(:new_order_page) { OrderNewPage.new(browser, true) }
  let(:index_page) { OrdersIndexPage.new(browser) }

  it 'todo' do
    new_order_page.create_order('test', '1')
    expect(index_page.text).to include('test')
  end

  after { browser.close }
end
