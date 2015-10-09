class SalesController < ApplicationController
  before_action :authenticate_shop!, only: [:edit, :update, :destroy]
  before_action :find_sale, exception: [:index]

  def index
  end

  def show
  end

  def new
    @shop = Shop.find(params[:shop_id])
    @sale = Sale.new
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @sale = @shop.sales.build(sale_params)
    if @sale.save
     redirect_to shop_sales_path(@shop), notice: 'Sale was successfully added'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @sale.destroy
    redirect_to shop_sales_path(@shop), notice: "You have just destroyed a dose"
  end

  private

  def sale_params
    params.require(:sale).permit
  end

  def find_sale
    @sale = Sale.find(params[:id])
  end

end
