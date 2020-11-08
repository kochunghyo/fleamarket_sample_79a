class OrdersController < ApplicationController

  require 'payjp'

  def new
    @product = Product.find(1)
    @user = current_user
    card = Creditcard.where(user_id: current_user.id).first
    if card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end

    def pay
      card = Creditcard.where(user_id: current_user.id).first
      product = Product.find(1)
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
      :amount => product.price, 
      :customer => card.customer_id, 
      :currency => 'jpy', 
    )
    redirect_to root_path 
    end

  end
end
