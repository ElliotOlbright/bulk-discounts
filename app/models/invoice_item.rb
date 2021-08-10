class InvoiceItem < ApplicationRecord
  enum status: { packaged: 0, pending: 1, shipped: 2 }

  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :unit_price, presence: true, numericality: { only_integer: true }
  validates :status, presence: true, inclusion: { in: InvoiceItem.statuses.keys }

  belongs_to :invoice
  belongs_to :item
  has_many :merchants, through: :item
  has_many :discounts, through: :merchants

  def best_discount
    discounts.where('? >= discounts.quantity', self.quantity)
    .order(discount: :desc)
    .first
  end

  def invoice_item_total
    (unit_price * quantity)/100.00
  end

  def discount_revenue
    if !best_discount.blank?
      (invoice_item_total * (1 - (best_discount.discount)))
    else
      invoice_item_total
    end
  end
end


# discounts.quantity >= invoice_item.quantity

