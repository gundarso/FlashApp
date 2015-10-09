class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :find_customer

  def show
  end

  def edit
  end

  def update
    if current_user == @customer
      @customer.update(customer_params)
      if @customer.save
        redirect_to customer_path(@customer), notice: "Your customer profile has been successfully updated"
      else
        render :edit
      end
    end
  end

  def destroy
    @customer.destroy
    redirect_to root_path, notice: "You have successfully deleted your customer profile"
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :family_name, :age, :gender, :base_location, {:category_ids => []})
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end
end

