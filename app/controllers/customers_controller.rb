class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :find_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customer = current_customer
    @categories = Category.all
    @search = params.fetch(:query, {})
    @shops = Shop.near(@search.fetch(:base_location, @customer.base_location), 10)
    @sales = Sale.where(category: @search.fetch(:category, @customer.categories))

    @sales = @sales.select { |sale| @shops.include?(sale.shop)}
    # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@sales) do |sale, marker|
      marker.lat sale.shop.latitude
      marker.lng sale.shop.longitude
      marker.infowindow render_to_string partial: "customers/card_map", locals: { shop: sale.shop  }
    end
  end

  def show
    if current_customer == @customer
      customer_path(@customer)
    else
      redirect_to :root, notice: "You are not authorized to view other people's profiles!"
    end
  end

  def edit
  end

  def update
    if current_customer == @customer
      @customer.update(customer_params)
        if @customer.valid?
          redirect_to customer_path(@customer), notice: "Your customer profile has been successfully updated"
        else
          render :edit
        end
    else
      redirect_to customer_path(@customer), notice: "You are not authorized to edit this page!"
    end
  end

  def destroy
    @customer.destroy
    redirect_to root_path, notice: "You have successfully deleted your customer profile"
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :family_name, :age, :gender, :base_location, :picture, {:category_ids => []})
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end

end

