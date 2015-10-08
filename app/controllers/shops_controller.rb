class ShopsController < ApplicationController
  before_action :authenticate_shop!, only: [:edit, :update, :destroy]
  before_action :find_shop

  def show
    @shop = Shop.find(params[:id])
    #@shop_coordinates = { lat: @shop.latitude, lng: @shop.longitude }
  end

  def edit
  end

  def update
    @shop.update(shop_params)
    if @shop.valid?
      redirect_to shop_path(@shop), notice: "Your shop was successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to root_path
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :street_address, :city, :postcode, :country, :opening, :closing, :phone, :contact_email, :category_id, :picture)
  end

  def find_shop
   @shop = Shop.find(params[:id])
  end

end
