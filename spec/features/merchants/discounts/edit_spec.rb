require 'rails_helper'

RSpec.describe 'Merchant Discount Edit Page' do 
  before :each do
    @merchant1 = Merchant.create!(name: 'Tom Holland') 

    @discount1 = Discount.create!(name: '20% Off', quantity: 10, discount: 0.2, merchant_id: @merchant1.id)

    visit edit_merchant_discount_path(@merchant1.id, @discount1.id)
  end

  it 'is on the correct page' do 
    expect(current_path).to eq(edit_merchant_discount_path(@merchant1.id, @discount1.id))
  end 

  it 'can dsiplay edit form' do 
    expect(page).to have_field('Name')
    expect(page).to have_field('Quantity')
    expect(page).to have_field('Discount')
  end

  it 'can update the discount' do 
    fill_in('Name', with: 'Super Sale!')
    fill_in('Discount', with: 0.75)
    fill_in('Quantity', with: 10)

    click_on 'Submit'

    expect(current_path).to eq(merchant_discount_path(@merchant1.id, @discount1.id))
  end
end