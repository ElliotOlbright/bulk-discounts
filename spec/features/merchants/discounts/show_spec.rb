require 'rails_helper'

RSpec.describe 'Merchant Discount show Page' do 
  before :each do 
    @merchant1 = Merchant.create!(name: 'Tom Holland') 

    @discount1 = Discount.create!(name: '20% Off', quantity: 10, discount: 0.2, merchant_id: @merchant1.id)

    visit merchant_discount_path(@merchant1.id, @discount1.id)
  end

  it 'is on the correct page' do 
    expect(current_path).to eq(merchant_discount_path(@merchant1.id, @discount1.id))
  end

  it 'can display the discount attibutes' do 
    expect(page).to have_content(@discount1.name)
    expect(page).to have_content(@discount1.discount * 100)
    expect(page).to have_content(@discount1.quantity)
  end

  it 'can take the user to edit the discount' do 
    click_on 'Edit This Discount'

    expect(current_path).to eq(edit_merchant_discount_path(@merchant1.id,@discount1.id))
  end
end 