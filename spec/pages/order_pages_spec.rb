require 'rails_helper'

feature 'Orders', js: true, type: :feature do
  let(:index_page) { OrdersIndexPage.new }
  let(:order) { create :order }

  describe 'new page' do
    let(:new_page) { OrdersNewPage.new }

    before :each do
      new_page.load
      expect(new_page).to be_displayed
      expect(new_page.form_visible?).to be_truthy
    end

    it 'create order' do
      new_page.create_order('New product', '10')
      expect(index_page).to have_success
      expect(index_page).to have_order_table
    end
  end

  describe 'edit page' do
    let(:edit_page) { OrdersEditPage.new }

    before :each do
      edit_page.load order_id: order.id
      expect(edit_page).to be_displayed
      expect(edit_page.form_visible?).to be_truthy
    end

    it 'edit order' do
      edit_page.product.set('test')
      edit_page.price.set('12')
      edit_page.save.click
      expect(index_page).to be_displayed
    end
  end

  describe 'show page' do
    let(:show_page) { OrdersShowPage.new }

    before :each do
      show_page.load order_id: order.id
      expect(show_page).to be_displayed
    end

    it { expect(show_page).to have_edit }
  end
end
