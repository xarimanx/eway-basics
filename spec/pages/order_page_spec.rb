require 'rails_helper'

feature 'Orders', js: true, type: :feature do
  describe 'new page' do
    let(:new_page) { OrdersNewPage.new }
    let(:index_page) { OrdersPage.new }

    before :each do
      new_page.load
      expect(new_page).to be_displayed
      expect(new_page.form_visible?).to be_truthy
    end

    it 'create order' do
      new_page.create_order('Test product', '10')
      expect(index_page).to be_displayed
    end
  end
end
