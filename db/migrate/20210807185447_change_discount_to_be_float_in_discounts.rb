class ChangeDiscountToBeFloatInDiscounts < ActiveRecord::Migration[5.2]
  def change
    change_column :discounts, :discount, :float
  end
end
