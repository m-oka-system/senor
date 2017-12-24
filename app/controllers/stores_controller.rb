class StoresController < ApplicationController

    before_action :authenticate_user!

    def show
      @customer = Customer.find(params[:customer_id])
      # @store = @customer.stores.find(params[:id])
      @store = Store.find(params[:id])
    end

    def index
      @customer = Customer.find(params[:customer_id])
      @store = @customer.stores
    end

    def new
      @customer = Customer.find(params[:customer_id])
      @store = @customer.stores.build
    end

    def create
      @customer = Customer.find(params[:customer_id])
      @store = @customer.stores.build(store_params)
      if @store.save
        flash[:success] = "店舗を登録しました。"
        redirect_to [@customer, @store]
      else
        render :new
      end
    end

    def edit
      @customer = Customer.find(params[:customer_id])
      @store = Store.find(params[:id])
      #@store = @customer.stores.find(params[:id])

    end

    def update
      @customer = Customer.find(params[:customer_id])
      @store = @customer.stores.find(params[:id])
      if @store.update_attributes(store_params) #update_attributesはSaveもする
        flash[:success] = "店舗を更新しました。"
        redirect_to [@customer, @store]
        # redirect_to customer_store_url(@store.customer_id, @store.id)
      else
        render :edit
      end
    end

    def destroy
      @customer = Customer.find(params[:customer_id])
      @store = Store.find(params[:id]).destroy
      flash[:success] = "店舗を削除しました。"
      redirect_to customers_url
    end

    private

    def store_params
      params.require(:store).permit(:store_code, :store_name, :postal_code, :prefectures, :city, :town_name, :phone_number, :fax_number, :business_hours_start, :business_hours_end, :pos_type, :ip_address, :remarks)
    end
end
