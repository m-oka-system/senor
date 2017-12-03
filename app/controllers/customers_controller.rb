class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customer = Customer.all
  end

  def new
  end

  def edit
  end
end
