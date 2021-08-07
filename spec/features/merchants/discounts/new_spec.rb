require 'rails_helper' 

RSpec.describe 'Merchant Invoice New Page' do 
  before :each do
    @merchant = Merchant.create!(name: 'Tom Holland', status: 0)

    visit new_merchant_discount_path(@merchant.id)
  end

  it 'is on the correct page' do 
    expect(current_path).to eq(new_merchant_discount_path(@merchant.id))
  end

  it 'can create a new discount' do 
    fill_in('name', with: 'Flash Sale')
    fill_in('discount', with: 0.15)
    fill_in('quantity', with: 5)
    click_on 'Create Discount'

    expect(current_path).to eq(merchant_discounts_path(@merchant.id))
    expect(page).to have_content('Flash Sale')
  end 

  it 'can tell user to fill in all fields' do 
    click_on 'Create Discount'

    expect(current_path).to eq(new_merchant_discount_path(@merchant.id))
    expect(page).to have_content('All fields are required.')
  end 
end