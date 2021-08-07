require 'rails_helper' 

RSpec.describe 'Merchant Discount Index Page' do 
  before :each do 
    @merchant1 = Merchant.create!(name: 'Tom Holland') 

    @discount1 = Discount.create!(name: '20% Off', quantity: 10, discount: 0.2, merchant_id: @merchant1.id)
    @discount2 = Discount.create!(name: '25% Off', quantity: 20, discount: 0.25, merchant_id: @merchant1.id)
    @discount3 = Discount.create!(name: '30% Off', quantity: 50, discount: 0.3, merchant_id: @merchant1.id)
    @discount4 = Discount.create!(name: '50% Off', quantity: 100, discount: 0.5, merchant_id: @merchant1.id)

    visit merchant_discounts_path(@merchant1.id)
  end

  it 'is on the right page' do 
    expect(current_path).to eq(merchant_discounts_path(@merchant1.id))
  end

  it 'can dsiplay all merchants discounts names' do 
    expect(page).to have_content(@discount1.name)
    expect(page).to have_content(@discount2.name)
    expect(page).to have_content(@discount3.name)
    expect(page).to have_content(@discount4.name)
  end

  it 'can dsiplay all merchants discounts discount' do 
    expect(page).to have_content(@discount1.discount * 100)
    expect(page).to have_content(@discount2.discount * 100)
    expect(page).to have_content(@discount3.discount * 100)
    expect(page).to have_content(@discount4.discount * 100)
  end
  it 'can dsiplay all merchants discounts quantity' do 
    expect(page).to have_content(@discount1.quantity)
    expect(page).to have_content(@discount2.quantity)
    expect(page).to have_content(@discount3.quantity)
    expect(page).to have_content(@discount4.quantity)
  end
end 