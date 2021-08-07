require 'rails_helper' 

RSpec.describe 'Merchant Invoice New Page' do 
  before :each do
    @merchant = Merchant.create!(name: 'Tom Holland', status: 0)

    visit new_merchant_discount_path(@merchant.id)
  end

  it 'is on the correct page' do 
    expect(current_path).to eq(new_merchant_discount_path(@merchant.id))
  end

  
end