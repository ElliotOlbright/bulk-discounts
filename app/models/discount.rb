class Discount < ApplicationRecord 
  belongs_to :merchant

  validates :name, presence: true
  validates :quantity, presence: true
  validates :discount, presence: true
end