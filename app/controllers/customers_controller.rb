class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :find_customer

  def show
  end

  def edit
  end

  def update
    @customer.update(customer_params)
    if @customer.save
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:username, :password)
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end
end

