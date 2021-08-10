require 'rails_helper'

RSpec.describe InvoiceItem do
  describe 'associations' do
    it { should belong_to :invoice }
    it { should belong_to :item }
    it { should have_many(:merchants), through: :item }
    it { should have_many(:discounts), through: :merchants }

  end

  describe 'validations' do
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :unit_price }
    it { should validate_presence_of :status }
    it { should validate_numericality_of(:quantity).only_integer }
    it { should validate_numericality_of(:unit_price).only_integer }
    it { should define_enum_for(:status).with_values([:packaged, :pending, :shipped]) }
  end

  describe 'instance methods' do
    before :each do 
      @merchant_1 = Merchant.create!(name: 'Tom Holland') 

      @discount_1 = Discount.create!(name: '20% Off', quantity: 10, discount: 0.2, merchant_id: @merchant_1.id)
      @discount_2 = Discount.create!(name: '25% Off', quantity: 20, discount: 0.25, merchant_id: @merchant_1.id)
      @discount_3 = Discount.create!(name: '30% Off', quantity: 50, discount: 0.3, merchant_id: @merchant_1.id)
      @discount_4 = Discount.create!(name: '50% Off', quantity: 100, discount: 0.5, merchant_id: @merchant_1.id)

      @customer_1 = Customer.create!(first_name: 'Tuco', last_name: 'Salamanca')

      @invoice_1 = @customer_1.invoices.create!(status: 0)
      @invoice_2 = @customer_1.invoices.create!(status: 0)


      @item_1 = Item.create!(name: '10 Gallon Drum', description: 'for storage', unit_price: 100, merchant_id: @merchant_1.id)
      @item_2 = Item.create!(name: '10 Gallon Drum', description: 'for storage', unit_price: 100, merchant_id: @merchant_1.id)


      @ii1 = InvoiceItem.create!(invoice: @invoice_1, item: @item_1, quantity: 10, unit_price: @item_1.unit_price, status: 1)
      @ii2 = InvoiceItem.create!(invoice: @invoice_2, item: @item_2, quantity: 5, unit_price: @item_2.unit_price, status: 1)

      @customer_1.invoices[0].transactions.create!(credit_card_number: '1234', credit_card_expiration_date: '', result: 0)
    end

    describe '#best_discount' do 
      it 'can find the best discount' do 
        expect(@ii1.best_discount).to eq(@discount_1)
      end
    end 

    describe '#invoice_item_total' do 
      it 'finds the invoice_item total revenue' do 
        expect(@ii1.invoice_item_total).to eq(10.0)
      end
    end

    describe '#discount_revenue' do 
      it 'can calculate the discount on the invoice_item' do 
        expect(@ii1.discount_revenue).to eq(8.0)
      end 

      it ' can return total if no discount it applied' do 

        expect(@ii2.discount_revenue).to eq(5.0)

      end 
    end
  end 
end
