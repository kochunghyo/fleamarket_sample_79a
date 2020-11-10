class OrdersController < ApplicationController

  require 'payjp'
  before_action :set_card, only: [:new,:pay]
  before_action :set_product, only: [:new,:pay]

  def new
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @product.price, 
    :customer => @card.customer_id, 
    :currency => 'jpy', 
  )

    @product.update(sales_status: "sold_out")
    redirect_to root_path 
  end

  def set_card
    @card = Creditcard.find_by(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(1)
  end

end
