class ShopsController < ApplicationController
  before_action :authenticate_shop!, only: [:edit, :update, :destroy]
  before_action :find_shop

  def show
    @shop_coordinates = { lat: @shop.latitude, lng: @shop.longitude }
  end

  def edit
  end

  def update
    if current_shop == @shop
      @shop.update(shop_params)
      if @shop.valid?
        redirect_to shop_path(@shop), notice: "Your shop profile has been successfully updated"
      else
        render :edit
      end
    else
      redirect_to shop_path(@shop), notice: "You are not authorized to edit this page!"
    end
  end

  def destroy
    @shop.destroy
    redirect_to root_path, notice: "You have successfully deleted your shop profile"
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :street_address, :city, :postcode, :country, :opening, :closing, :phone, :contact_email, {:category_ids => []}, :picture)
  end

  def find_shop
   @shop = Shop.find(params[:id])
  end

end
