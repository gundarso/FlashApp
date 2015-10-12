class SalesController < ApplicationController
  before_action :authenticate_shop!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_shop
  before_action :find_sale, only: [:show, :edit, :update, :destroy]

  def index
    @sales = Sale.all

    # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@sales) do |sale, marker|
      marker.lat sale.latitude
      marker.lng sale.longitude
  end

  def show
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = @shop.sales.build(sale_params)
    if @sale.save
     redirect_to shop_sales_path(@shop), notice: 'The sale was successfully added'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sale.save
     redirect_to shop_sale_path(@shop, @sale), notice: 'The sale was successfully edited'
    else
      render :edit
    end
  end

  def destroy
    @sale.destroy
    redirect_to shop_sales_path(@shop), notice: "The sale was successfully deleted"
  end

  private

  def sale_params
    params.require(:sale).permit(:product_name, :product_description, :product_quantity, :picture, :price, :terms, :starting, :ending, :category_id, :shop_id)
  end

  def find_sale
    @sale = Sale.find(params[:id])
  end

   def find_shop
    @shop = Shop.find(params[:shop_id])
  end

end
