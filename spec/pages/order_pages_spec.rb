require 'rails_helper'

feature 'Orders', js: true, type: :feature do
  let(:index_page) { OrdersIndexPage.new }
  let(:order) { create :order }

  describe '#new' do
    let(:new_page) { OrdersNewPage.new }

    before :each do
      new_page.load
      expect(new_page).to be_displayed
      expect(new_page.form_visible?).to be_truthy
    end

    it 'order' do
      new_page.create_order('New product', '10')
      expect(index_page).to have_success
      expect(index_page).to have_order_table
    end

    it 'with errors' do
      new_page.product.set('New product') # it's the same as 17 string
      new_page.price.set('abc')
      new_page.save.click
      expect(new_page.error.visible?).to be_truthy
    end
  end

  describe '#edit' do
    let(:edit_page) { OrdersEditPage.new }

    before :each do
      edit_page.load order_id: order.id
      expect(edit_page).to be_displayed
      expect(edit_page.form_visible?).to be_truthy
    end

    it 'order' do
      edit_page.create_order('Edited order', '8.20')
      expect(index_page).to be_displayed
      expect(index_page.success.text).to eq('×Updated!')
    end
  end

  describe '#show page' do
    let(:show_page) { OrdersShowPage.new }

    before :each do
      show_page.load order_id: order.id
      expect(show_page).to be_displayed
    end

      it { expect(show_page).to have_back }
      it { expect(show_page).to have_edit }
      it { expect(show_page).to have_delete }
      it { expect(show_page.text).to include("Product: #{order.product}", "Price: $#{order.price}") }
  end

  describe 'todo' do
    let(:checkout_page) { CheckoutEditPage.new }
    let(:order_2) { create :order, price: 10 }

    before :each do
      checkout_page.load order_id: order_2.id
    end

    it 'ololo' do
      checkout_page.pay_as_jrandom
      expect(page).to have_content('"ResponseMessage":"A2000"') # TODO change to finalize page
    end
  end
end
