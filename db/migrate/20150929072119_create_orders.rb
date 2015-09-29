class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :product
      t.decimal :price, precision: 10, scale: 2
      t.boolean :paid, default: 0

      t.timestamps null: false
    end
  end
end
