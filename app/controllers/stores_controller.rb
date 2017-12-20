class StoresController < ApplicationController

    before_action :authenticate_user!

    def show
      @customer = Customer.find(params[:customer_id])
      @store = @customer.stores.find(params[:id])
    end

    def index
      @customer = Customer.find(params[:customer_id])
      @store = @customer.stores
    end

    def new
      # @store = Store.new
      @customer = Customer.find(params[:customer_id])
      @store = @customer.stores.build
      # p "------------------------------"
      # p @customer
      # p "------------------------------"

    end

    def create
      @customer = Customer.find(params[:customer_id])
      @store = @customer.stores.build(store_params)
      if @store.save
        flash[:success] = "店舗を登録しました。"
        # render :index
        redirect_to [@customer, @store]
      else
        render :new
      end
    end

    def edit
    end

    def destroy
      @store = Store.find(params[:id]).destroy
      flash[:success] = "店舗を削除しました。"
      redirect_to stores_url
    end

    private

    def store_params
      params.require(:store).permit(:store_code, :store_name, :postal_code, :prefectures, :city, :town_name, :phone_number, :fax_number, :business_hours_start, :business_hours_end, :pos_type, :ip_address, :remarks)
    end

end
