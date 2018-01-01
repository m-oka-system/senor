class TicketsController < ApplicationController

  before_action :authenticate_user!

  def index
    @store = Store.find(params[:store_id])
    @ticket = @store.tickets
  end

  def show
    @store = Store.find(params[:store_id])
    @ticket = Ticket.find(params[:id])
  end

  def new
    @store = Store.find(params[:store_id])
    @ticket = @store.tickets.build
  end

  def edit
    @store = Store.find(params[:store_id])
    @ticket = Ticket.find(params[:id])
  end

  def create
    @store = Customer.find(params[:customer_id])
    @ticket = @store.tickets.build(ticket_params)
    if @ticket.save
      flash[:success] = "インシデントを登録しました。"
      redirect_to [@store, @ticket]
    else
      render :new
    end
  end

  def update
    @store = Store.find(params[:store_id])
    @ticket = @store.tickets.find(params[:id])
    if @ticket.update_attributes(ticket_params) #update_attributesはSaveもする
      flash[:success] = "チケットを更新しました。"
      redirect_to [@store, @ticket]
    else
      render :edit
    end
  end

  def destroy
    @store = Store.find(params[:store_id])
    @tikcket = Ticket.find(params[:id]).destroy
    flash[:success] = "インシデントを削除しました。"
    redirect_to tickets_url
  end

  private

  def ticket_params
    params.require(:ticket).permit()
  end

end
