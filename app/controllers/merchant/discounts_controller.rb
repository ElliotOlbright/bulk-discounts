class Merchant::DiscountsController < ApplicationController 
  def index 
    @merchant = Merchant.find(params[:merchant_id])
    @discounts = @merchant.discounts
  end 

  def show
    @merchant = Merchant.find(params[:merchant_id]) 
    @discount = Discount.find(params[:id])
  end

  def new 
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create 
    @merchant = Merchant.find(params[:merchant_id])
    @discount = Discount.new(discount_params)
    if @discount.save
      redirect_to merchant_discounts_path(params[:merchant_id])
      flash[:notice] = "#{@discount.name} successfully Created."
    else
      redirect_to new_merchant_discount_path(params[:merchant_id])
      flash[:alert] = "All fields are required."
    end
  end

  private

  def discount_params
    params.permit(:name, :quantity, :discount, :merchant_id)
  end
end