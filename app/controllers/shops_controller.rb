class ShopsController < ApplicationController
  before_action :authenticate_shop!, only: [:edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
