class CustomersController < ApplicationController

  before_action :authenticate_user!

  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customer = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:success] = "顧客を登録しました。"
      redirect_to customers_url
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @customer = Customer.find(params[:id]).destroy
    flash[:success] = "顧客を削除しました。"
    redirect_to customers_url
  end

  private

  def customer_params
    params.require(:customer).permit(:customer_name, :postal_code, :business, :prefectures, :city, :town_name, :phone_number, :fax_number, :url, :image)
  end

end
