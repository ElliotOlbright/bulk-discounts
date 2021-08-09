class Merchant::DiscountsController < ApplicationController 

  before_action :find_discount, only: [:show, :edit, :update, :destroy]
  before_action :find_merchant, only: [:index, :show, :edit, :new, :create, :update]

  def index 
    @discounts = @merchant.discounts
  end 

  def show
  end

  def new 
  end

  def create 
    @discount = Discount.new(discount_params)
    if @discount.save
      redirect_to merchant_discounts_path(params[:merchant_id])
      flash[:notice] = "#{@discount.name} successfully Created."
    else
      redirect_to new_merchant_discount_path(params[:merchant_id])
      flash[:alert] = "All fields are required."
    end
  end

  def edit 
  end

  def update 
    if @discount.update(discount_model_params)
      flash[:alert] = "Successfully Updated #{@discount.name}"
      redirect_to merchant_discount_path(@merchant.id, @discount.id)
    else 
      flash[:alert] = "All fields are required."
      redirect_to edit_merchant_discount_path(@merchant.id, @discount.id)
    end
  end

  def destroy 
    @discount.destroy
    redirect_to merchant_discounts_path(params[:merchant_id])
    flash[:notice] = "#{@discount.name} Successfully Deleted."
  end

  private

  def find_discount
    @discount = Discount.find(params[:id])
  end 
  
  def find_merchant 
    @merchant = Merchant.find(params[:merchant_id]) 
  end 

  def discount_params
    params.permit(:name, :quantity, :discount, :merchant_id)
  end

  def discount_model_params 
    params.require(:discount).permit(:name, :quantity, :discount)
  end
end