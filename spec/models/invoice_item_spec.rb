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

    end
    describe '#create_discount' do 
      it 'can add discount to invoice item' do 
      
      end
      #if discount quantity is =< to InvoiceItem quantity then add discount
      
    end
  end 
end
