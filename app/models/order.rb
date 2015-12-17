class Order < ActiveRecord::Base
  validates :product, presence: true
  validates :price, presence: true, numericality: true

  def price_in_cents
    (price * 100).to_i
  end
end
